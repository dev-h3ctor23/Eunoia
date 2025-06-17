# Proyecto Eunoia - Laravel 12

Este es un proyecto Laravel 12 con React, TypeScript y configuración Docker completa para desarrollo moderno.

## Stack Tecnológico

- **Backend**: Laravel 12.18.0 + PHP 8.3.11
- **Frontend**: React 18 + TypeScript + Vite
- **Base de Datos**: MySQL 8.0
- **Cache**: Redis 7
- **Contenedores**: Docker + Docker Compose
- **Herramientas**: Inertia.js, TailwindCSS

## Requisitos del Sistema

### Desarrollo Local
- PHP 8.3.11 o superior
- Composer 2.8.5 o superior
- Node.js 18+ y npm
- Extensiones PHP: bcmath, ctype, fileinfo, json, mbstring, openssl, PDO, tokenizer, xml

### Desarrollo con Docker (Recomendado)
- Docker Desktop
- Git

## Instalación y Configuración

### Opción 1: Desarrollo con Docker (Recomendado)

1. **Clonar el repositorio:**
   ```bash
   git clone <url-del-repositorio>
   cd Eunoia
   ```

2. **Iniciar entorno Docker:**
   ```powershell
   # En Windows
   .\start-docker.ps1
   
   # O manualmente
   docker-compose up --build -d
   ```

3. **Acceder a la aplicación:**
   - Laravel: http://localhost:8000
   - Vite Dev Server: http://localhost:3000
   - phpMyAdmin: http://localhost:8080

### Opción 2: Desarrollo Local

### Opción 2: Desarrollo Local

1. **Instalar dependencias:**
   ```bash
   composer install
   npm install
   ```

2. **Configurar entorno:**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

3. **Configurar base de datos en `.env`**

4. **Ejecutar migraciones:**
   ```bash
   php artisan migrate
   ```

5. **Iniciar servidores:**
   ```bash
   # Terminal 1
   php artisan serve
   
   # Terminal 2
   npm run dev
   ```

## Entorno Docker

### Servicios Incluidos

| Servicio | Puerto | URL | Descripción |
|----------|--------|-----|-------------|
| Laravel | 8000 | http://localhost:8000 | Aplicación principal |
| Vite HMR | 3000 | http://localhost:3000 | Hot Module Replacement |
| MySQL | 3306 | - | Base de datos |
| Redis | 6379 | - | Cache y sesiones |
| phpMyAdmin | 8080 | http://localhost:8080 | Gestión BD |

### Scripts Docker Disponibles

```powershell
# Iniciar entorno completo
.\start-docker.ps1

# Detener entorno
.\stop-docker.ps1

# Limpiar entorno (elimina volúmenes)
.\clean-docker.ps1

# Desarrollo local con hot reload
.\start-dev.ps1
```

### Comandos Make (Opcional)

```bash
make up      # Iniciar servicios
make down    # Detener servicios
make build   # Construir imágenes
make logs    # Ver logs
make shell   # Acceder al contenedor
make clean   # Limpiar todo
```

## Desarrollo

### Frontend (React + TypeScript)

```bash
# Desarrollo con hot reload
npm run dev

# Build para producción  
npm run build

# Preview del build
npm run preview

# Verificación de tipos
npm run type-check

# Tests
npm run test
npm run test:ui
npm run test:coverage

# Linting
npm run lint
npm run lint:fix
```

### Backend (Laravel)

```bash
# Servidor de desarrollo
php artisan serve

# Comandos artisan útiles
php artisan route:list
php artisan cache:clear
php artisan config:clear
php artisan make:controller NombreController
php artisan make:model NombreModelo
php artisan make:migration crear_tabla_nombre
```

### Variables de Entorno

#### Configuración Local (`.env`)
```env
APP_URL=http://localhost:8000
DB_HOST=127.0.0.1
REDIS_HOST=127.0.0.1
```

#### Configuración Docker (`.env.docker`)
```env
APP_URL=http://localhost:8000
DB_HOST=mysql
REDIS_HOST=redis
CACHE_STORE=redis
```

## Estructura del Proyecto

```
Eunoia/
├── app/                    # Código Laravel (controladores, modelos)
├── resources/
│   ├── js/                 # Frontend React + TypeScript
│   │   ├── Components/     # Componentes reutilizables
│   │   ├── Pages/          # Páginas/vistas principales
│   │   ├── types/          # Definiciones TypeScript
│   │   ├── hooks/          # Custom hooks React
│   │   └── utils/          # Funciones utilitarias
│   ├── css/                # Estilos CSS
│   └── views/              # Plantillas Blade
├── routes/                 # Rutas web y API
├── database/               # Migraciones y seeders
├── docker-compose.yml      # Configuración Docker
├── Dockerfile              # Imagen Docker personalizada
├── vite.config.js          # Configuración Vite
├── tsconfig.json           # Configuración TypeScript
└── package.json            # Dependencias Node.js
```

### Estilos (CSS Puro)
- `resources/css/` - **Estilos de la aplicación**
  - `app.css` - Archivo principal con variables globales y reset CSS
  - `components/` - Componentes CSS (botones, cards, modals, alerts)
  - `utils/` - Clases utilitarias (spacing, text, layout, flexbox)
  - **Sistema de diseño**: Variables CSS para colores, tipografías y espaciado
  - **CSS Modular**: Organizado por componentes y funcionalidades

### Templates
- `resources/views/` - Plantillas Blade (integración Laravel-React)
  - `welcome.blade.php` - Plantilla principal de bienvenida

### Configuración Frontend
- `vite.config.js` - Configuración del bundler Vite
- `tsconfig.json` - Configuración TypeScript para frontend
- `tsconfig.node.json` - Configuración TypeScript para herramientas
- `package.json` - Dependencias y scripts de Node.js

### Tecnologías Frontend
- **React 19.1.0** - Librería de interfaz de usuario
- **TypeScript 5.8.3** - Superset tipado de JavaScript
- **CSS Puro** - Sistema de diseño modular sin frameworks
- **Vite 6.2.4** - Build tool y dev server ultrarrápido
- **Vitest 3.2.3** - Framework de testing unitario
- **Axios 1.8.2** - Cliente HTTP para APIs

## Convenciones y Patrones Frontend

### Organización de Componentes
```
components/
├── ui/              # Componentes base (Button, Input, Modal)
├── forms/           # Componentes de formularios
├── navigation/      # Componentes de navegación
└── feature/         # Componentes específicos de funcionalidades
```

### Patrones de Naming
- **Componentes**: PascalCase (`UserProfile.tsx`)
- **Hooks**: camelCase con prefijo 'use' (`useAuth.ts`)
- **Services**: camelCase (`authService.ts`)
- **Types**: PascalCase (`UserData.ts`)
- **Utils**: camelCase (`formatDate.ts`)

### Estructura de Archivos
```javascript
// Ejemplo de componente típico
components/
├── UserCard/
│   ├── index.tsx          # Componente principal
│   ├── UserCard.test.tsx  # Tests del componente
│   └── styles.css         # Estilos específicos (si no se usa solo Tailwind)
```

### Flujo de Desarrollo
1. **Desarrollo**: `npm run dev` (Vite + HMR)
2. **Tipado**: `npm run type-check` (Verificación TypeScript)
3. **Testing**: `npm run test` (Vitest)
4. **Linting**: `npm run lint` (Oxlint)
5. **Build**: `npm run build` (Producción)

### Alias de Imports
```typescript
// Configurado en vite.config.js y tsconfig.json
import { Button } from '@/components/ui/Button';
import { useAuth } from '@/hooks/useAuth';
import { ApiService } from '@/services/ApiService';
```

## Estado Actual

### Backend (Laravel)
✅ Laravel 12.18.0 instalado y configurado  
✅ Servidor de desarrollo funcionando  
✅ Dependencias de Composer instaladas  
✅ Archivo .env configurado  
✅ Clave de aplicación generada  

### Frontend (React + TypeScript)
✅ React 19.1.0 configurado e instalado  
✅ TypeScript 5.8.3 con configuración optimizada  
✅ CSS Puro configurado con sistema de diseño modular  
✅ Vite 6.2.4 como build tool y dev server  
✅ Estructura de directorios frontend organizada  
✅ Alias de imports configurados (@/...)  
✅ Testing setup con Vitest 3.2.3  
✅ Linting configurado con Oxlint  
✅ Dependencias de npm instaladas y actualizadas  

### Infraestructura (Docker)
✅ Docker Desktop configurado y funcionando  
✅ MySQL 8.0 ejecutándose en Docker (Puerto 3306)  
✅ Redis 7.4.4 ejecutándose en Docker (Puerto 6379)  
✅ phpMyAdmin accesible en http://localhost:8080  
✅ Conectividad Redis verificada  
✅ Base de datos MySQL operativa  
✅ Dockerfile optimizado y libre de vulnerabilidades

## Próximos Pasos

### Backend
1. ✅ ~~Configurar una base de datos (MySQL, PostgreSQL, etc.)~~ - **Completado con Docker**
2. Ejecutar migraciones: `php artisan migrate`
3. Configurar autenticación si es necesario
4. Configurar Redis para cache y colas de trabajo
5. Implementar sistema de autenticación y autorización
6. Desarrollar APIs RESTful para el frontend

### Frontend
1. Crear componente principal App.tsx (migrar de app.js)
2. Implementar estructura de routing con React Router
3. Desarrollar componentes UI base (Button, Input, Modal, etc.)
4. Crear layouts principales (AppLayout, AuthLayout)
5. Implementar sistema de autenticación en React
6. Configurar estado global (Context API o Redux)
7. Desarrollar páginas principales de la aplicación
8. Implementar testing unitario para componentes
9. Configurar PWA (Progressive Web App) si es necesario

### Integración
1. Conectar frontend React con APIs de Laravel
2. Implementar manejo de errores global
3. Configurar interceptors para autenticación
4. Optimizar build para producción
5. Configurar CI/CD pipeline

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

## Desarrollo con Docker 🐳

Este proyecto incluye una configuración Docker completa para un entorno de desarrollo unificado.

### Servicios Incluidos

- **Laravel App**: Puerto 8000 (con supervisord para manejar Laravel + Vite)
- **Vite Dev Server**: Puerto 3000 (Hot Module Replacement)
- **MySQL 8.0**: Puerto 3306
- **Redis 7**: Puerto 6379
- **phpMyAdmin**: Puerto 8080

### Inicio Rápido con Docker

1. **Ejecutar el script de inicio:**
   ```powershell
   .\start-docker.ps1
   ```

2. **O manualmente:**
   ```bash
   docker-compose up --build -d
   ```

3. **Acceder a la aplicación:**
   - Laravel: http://localhost:8000
   - Vite Dev: http://localhost:3000
   - phpMyAdmin: http://localhost:8080

### Scripts de Docker Disponibles

- `start-docker.ps1` - Inicia todo el entorno Docker
- `stop-docker.ps1` - Detiene el entorno Docker
- `clean-docker.ps1` - Limpia contenedores y volúmenes

### Comandos Make (opcional)

Si tienes `make` instalado:

```bash
make up      # Iniciar servicios
make down    # Detener servicios
make logs    # Ver logs
make shell   # Acceder al contenedor
make clean   # Limpiar todo
```

### Configuración de Entorno para Docker

El proyecto incluye `.env.docker` con configuraciones optimizadas para Docker. Las principales diferencias son:

- `DB_HOST=mysql` (nombre del servicio Docker)
- `REDIS_HOST=redis` (nombre del servicio Docker)
- `CACHE_STORE=redis` (usar Redis para caché)

### Desarrollo en Docker

Cuando desarrolles con Docker:

1. **Hot Reload**: Vite está configurado con polling para detectar cambios de archivos
2. **Volúmenes**: El código está montado como volumen para desarrollo en tiempo real
3. **Logs**: Usa `docker-compose logs -f app` para ver logs en tiempo real
4. **Ejecutar comandos**: `docker-compose exec app php artisan [comando]`

### Resolución de Problemas Docker

**Si el contenedor no inicia:**
```bash
docker-compose logs app
```

**Si hay problemas de permisos:**
```bash
docker-compose exec app chown -R 9999:9999 /var/www/html/storage
```

**Si Redis no conecta:**
```bash
docker-compose exec app php artisan tinker
>>> Redis::ping()
```
