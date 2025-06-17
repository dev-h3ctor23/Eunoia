# Proyecto Eunoia - Laravel 12

Este es un proyecto Laravel creado con la última versión del framework (Laravel 12.18.0).

## Requisitos del Sistema

- PHP 8.3.11 o superior
- Composer 2.8.5 o superior
- Node.js y npm
- Docker Desktop
- Extensiones de PHP: bcmath, ctype, fileinfo, json, mbstring, openssl, PDO, tokenizer, xml

## Instalación

1. **Clonar el repositorio:**
   ```bash
   git clone <url-del-repositorio>
   cd Eunoia
   ```

2. **Instalar dependencias de PHP:**
   ```bash
   composer install
   ```

3. **Instalar dependencias de Node.js:**
   ```bash
   npm install
   ```

4. **Configurar el archivo de entorno:**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

5. **Configurar la base de datos:**
   Edita el archivo `.env` con tus credenciales de base de datos.

## Configuración con Docker

Este proyecto incluye una configuración completa con Docker que incluye MySQL, Redis y phpMyAdmin.

### Iniciar los servicios con Docker

1. **Asegúrate de que Docker Desktop esté ejecutándose:**
   ```bash
   docker --version
   ```

2. **Iniciar todos los servicios:**
   ```bash
   docker-compose up -d
   ```

3. **O iniciar servicios específicos:**
   ```bash
   docker-compose up -d mysql redis phpmyadmin
   ```

### Servicios Disponibles

- **MySQL 8.0**: Puerto 3306
  - Base de datos: `eunoia`
  - Usuario: `root`
  - Contraseña: `password`

- **Redis 7.4.4**: Puerto 6379
  - Usado para cache y colas de trabajo
  - Sin autenticación por defecto

- **phpMyAdmin**: Puerto 8080
  - Acceso web: http://localhost:8080
  - Gestión de base de datos MySQL

### Comandos Docker Útiles

- **Ver contenedores activos:** `docker ps`
- **Ver logs de un servicio:** `docker-compose logs [servicio]`
- **Detener servicios:** `docker-compose down`
- **Reiniciar un servicio:** `docker-compose restart [servicio]`
- **Acceder al CLI de Redis:** `docker exec -it eunoia-redis-1 redis-cli`
- **Acceder al CLI de MySQL:** `docker exec -it eunoia-mysql-1 mysql -u root -p`

### Verificación de Servicios

Para verificar que todo funciona correctamente:

```bash
# Verificar Redis
docker exec -it eunoia-redis-1 redis-cli ping
# Debería responder: PONG

# Verificar MySQL
docker exec eunoia-mysql-1 mysqladmin -u root -ppassword ping
# Debería responder: mysqld is alive

# Ver información de Redis
docker exec -it eunoia-redis-1 redis-cli info server
```

## Desarrollo

### Iniciar el servidor de desarrollo
```bash
php artisan serve
```
El servidor estará disponible en: http://127.0.0.1:8000

### Compilar assets (desarrollo)
```bash
npm run dev
```

### Compilar assets (producción)
```bash
npm run build
```

## Comandos Útiles

- **Limpiar caché:** `php artisan cache:clear`
- **Limpiar configuración:** `php artisan config:clear`
- **Ver rutas:** `php artisan route:list`
- **Crear controlador:** `php artisan make:controller NombreController`
- **Crear modelo:** `php artisan make:model NombreModelo`
- **Crear migración:** `php artisan make:migration crear_tabla_nombre`

## Estructura del Proyecto

- `app/` - Código de la aplicación (controladores, modelos, etc.)
- `routes/` - Definición de rutas
- `resources/views/` - Plantillas Blade
- `resources/css/` y `resources/js/` - Assets del frontend
- `database/` - Migraciones y seeders
- `config/` - Archivos de configuración

## Estado Actual

✅ Laravel 12.18.0 instalado y configurado  
✅ Servidor de desarrollo funcionando  
✅ Dependencias de Composer instaladas  
✅ Dependencias de npm instaladas  
✅ Archivo .env configurado  
✅ Clave de aplicación generada  
✅ Docker Desktop configurado y funcionando  
✅ MySQL 8.0 ejecutándose en Docker (Puerto 3306)  
✅ Redis 7.4.4 ejecutándose en Docker (Puerto 6379)  
✅ phpMyAdmin accesible en http://localhost:8080  
✅ Conectividad Redis verificada  
✅ Base de datos MySQL operativa

## Próximos Pasos

1. ✅ ~~Configurar una base de datos (MySQL, PostgreSQL, etc.)~~ - **Completado con Docker**
2. Ejecutar migraciones: `php artisan migrate`
3. Configurar autenticación si es necesario
4. Desarrollar la funcionalidad específica del proyecto
5. Configurar Redis para cache y colas de trabajo
6. Implementar sistema de autenticación y autorización

---

**Versión Laravel:** 12.18.0  
**Versión PHP:** 8.3.11  
**Docker:** 28.0.4  
**MySQL:** 8.0.42  
**Redis:** 7.4.4  
**Fecha de instalación:** 17 de junio de 2025  
**Última actualización:** 17 de junio de 2025 - Configuración Docker completada

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

You may also try the [Laravel Bootcamp](https://bootcamp.laravel.com), where you will be guided through building a modern Laravel application from scratch.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains thousands of video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the [Laravel Partners program](https://partners.laravel.com).

### Premium Partners

- **[Vehikl](https://vehikl.com)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Curotec](https://www.curotec.com/services/technologies/laravel)**
- **[DevSquad](https://devsquad.com/hire-laravel-developers)**
- **[Redberry](https://redberry.international/laravel-development)**
- **[Active Logic](https://activelogic.com)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
