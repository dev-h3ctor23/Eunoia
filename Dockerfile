# Usar imagen PHP optimizada y con menos vulnerabilidades
FROM serversideup/php:8.3-fpm-nginx-alpine

# Cambiar a usuario root temporalmente para instalaciones
USER root

# Instalar dependencias adicionales del sistema
RUN apk update && apk add --no-cache \
    git \
    libzip-dev \
    zip \
    unzip \
    nodejs \
    npm \
    supervisor \
    && rm -rf /var/cache/apk/*

# Instalar extensiones adicionales de PHP si es necesario
RUN docker-php-ext-install zip

# Instalar Redis extension (verificar si ya está instalada)
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && (pecl install redis || echo "Redis extension may already be installed") \
    && docker-php-ext-enable redis \
    && apk del .build-deps

# Establecer directorio de trabajo
WORKDIR /var/www/html

# Copiar composer files primero para aprovechar cache de Docker
COPY --chown=9999:9999 composer.json composer.lock ./

# Instalar dependencias PHP
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Copiar package files para dependencias Node.js
COPY --chown=9999:9999 package*.json ./

# Instalar dependencias Node.js
RUN npm ci --only=production

# Copiar el resto de archivos de la aplicación
COPY --chown=9999:9999 . .

# Ejecutar scripts de composer después de copiar todos los archivos
RUN composer dump-autoload --optimize

# Compilar assets para producción (solo si no estamos en desarrollo)
RUN npm run build

# Asegurar permisos correctos
RUN chown -R 9999:9999 /var/www/html \
    && chmod -R 755 /var/www/html/storage \
    && chmod -R 755 /var/www/html/bootstrap/cache

# Crear directorios necesarios si no existen
RUN mkdir -p /var/www/html/storage/logs \
    && mkdir -p /var/www/html/storage/framework/cache \
    && mkdir -p /var/www/html/storage/framework/sessions \
    && mkdir -p /var/www/html/storage/framework/views

# Exponer puertos
EXPOSE 8000 3000

# Crear configuración de supervisord más robusta
RUN mkdir -p /etc/supervisor/conf.d \
    && echo '[supervisord]' > /etc/supervisord.conf \
    && echo 'nodaemon=true' >> /etc/supervisord.conf \
    && echo 'user=root' >> /etc/supervisord.conf \
    && echo 'pidfile=/var/run/supervisord.pid' >> /etc/supervisord.conf \
    && echo 'logfile=/var/log/supervisord.log' >> /etc/supervisord.conf \
    && echo 'logfile_maxbytes=50MB' >> /etc/supervisord.conf \
    && echo 'logfile_backups=10' >> /etc/supervisord.conf \
    && echo 'loglevel=info' >> /etc/supervisord.conf \
    && echo '' >> /etc/supervisord.conf \
    && echo '[program:laravel]' >> /etc/supervisord.conf \
    && echo 'command=php artisan serve --host=0.0.0.0 --port=8000' >> /etc/supervisord.conf \
    && echo 'directory=/var/www/html' >> /etc/supervisord.conf \
    && echo 'user=9999' >> /etc/supervisord.conf \
    && echo 'autostart=true' >> /etc/supervisord.conf \
    && echo 'autorestart=true' >> /etc/supervisord.conf \
    && echo 'stdout_logfile=/var/log/laravel.log' >> /etc/supervisord.conf \
    && echo 'stderr_logfile=/var/log/laravel_error.log' >> /etc/supervisord.conf \
    && echo '' >> /etc/supervisord.conf \
    && echo '[program:vite]' >> /etc/supervisord.conf \
    && echo 'command=npm run dev -- --host=0.0.0.0 --port=3000' >> /etc/supervisord.conf \
    && echo 'directory=/var/www/html' >> /etc/supervisord.conf \
    && echo 'user=9999' >> /etc/supervisord.conf \
    && echo 'autostart=true' >> /etc/supervisord.conf \
    && echo 'autorestart=true' >> /etc/supervisord.conf \
    && echo 'stdout_logfile=/var/log/vite.log' >> /etc/supervisord.conf \
    && echo 'stderr_logfile=/var/log/vite_error.log' >> /etc/supervisord.conf

# Cambiar de vuelta al usuario no-root
USER 9999

# Script de entrada para inicialización
USER root
COPY --chown=9999:9999 <<EOF /docker-entrypoint.sh
#!/bin/sh
set -e

# Ejecutar migraciones si es necesario
if [ "\$APP_ENV" = "local" ] || [ "\$RUN_MIGRATIONS" = "true" ]; then
    php artisan migrate --force
    php artisan db:seed --force || true
fi

# Generar app key si no existe
php artisan key:generate --force || true

# Limpiar cache
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Ejecutar supervisord
exec /usr/bin/supervisord -c /etc/supervisord.conf
EOF

RUN chmod +x /docker-entrypoint.sh

# Comando para iniciar el contenedor
CMD ["/docker-entrypoint.sh"]
