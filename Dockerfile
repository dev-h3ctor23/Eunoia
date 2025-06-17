# Usar imagen PHP optimizada y con menos vulnerabilidades
FROM serversideup/php:8.3-fpm-nginx-alpine

# Instalar dependencias adicionales del sistema
RUN apk update && apk add --no-cache \
    git \
    libzip-dev \
    zip \
    unzip \
    nodejs \
    npm

# Alpine no necesita limpiar cache como apt-get
# RUN apk del .build-deps se ejecutará automáticamente

# Instalar extensiones adicionales de PHP si es necesario
RUN docker-php-ext-install zip

# Instalar Redis extension
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del .build-deps

# Instalar Composer (usar versión incluida en la imagen base)
# COPY --from=composer:2.8-bin /composer /usr/bin/composer

# Crear usuario no-root para mejor seguridad (puede que ya esté en la imagen base)
# RUN addgroup -g 1000 laravel && adduser -D -s /bin/sh -u 1000 -G laravel laravel

# Establecer directorio de trabajo
WORKDIR /var/www/html

# Copiar archivos de la aplicación
COPY . .

# Instalar dependencias PHP
RUN composer install --no-dev --optimize-autoloader

# Instalar dependencias Node.js
RUN npm install

# Compilar assets
RUN npm run build

# Configurar permisos (ya no necesario, se ejecuta como usuario laravel)
# Los permisos se manejan con --chown en COPY

# Exponer puerto
EXPOSE 8000

# Comando para iniciar la aplicación
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
