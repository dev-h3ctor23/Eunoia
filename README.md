# Eunoia

**Aplicación web moderna desarrollada con Laravel 12, React 18 y TypeScript**

Eunoia es un proyecto de desarrollo web que combina las mejores prácticas de desarrollo backend y frontend, proporcionando una base sólida para aplicaciones web escalables y mantenibles.

## Stack Tecnológico

### Backend
- **Laravel 12.18.0** - Framework PHP robusto y elegante
- **PHP 8.3.11** - Última versión estable de PHP
- **MySQL 8.0** - Base de datos relacional de alto rendimiento
- **Redis 7** - Cache en memoria y gestión de sesiones

### Frontend
- **React 18** - Biblioteca de interfaz de usuario moderna
- **TypeScript** - JavaScript tipado para mayor robustez
- **Vite** - Build tool ultrarrápido para desarrollo
- **Inertia.js** - SPA sin API, conectando Laravel y React

### DevOps y Herramientas
- **Docker + Docker Compose** - Contenedorización completa
- **TailwindCSS** - Framework CSS utility-first
- **ESLint + Prettier** - Linting y formateo de código
- **phpMyAdmin** - Administración de base de datos

## Requisitos del Sistema

### Para Desarrollo con Docker (Recomendado)
- Docker Desktop 4.0+ con Docker Compose
- Git 2.0+
- PowerShell 5.0+ (Windows) o Bash (Linux/macOS)

### Para Desarrollo Local
- **PHP**: 8.3.11 o superior
- **Composer**: 2.8.5 o superior  
- **Node.js**: 18+ con npm
- **Base de datos**: MySQL 8.0 o PostgreSQL 13+
- **Extensiones PHP**: bcmath, ctype, fileinfo, json, mbstring, openssl, PDO, tokenizer, xml

## Inicio Rápido

### 🐳 Desarrollo con Docker (Recomendado)

1. **Clonar e inicializar:**
   ```powershell
   git clone <url-del-repositorio>
   cd Eunoia
   
   # Iniciar entorno completo
   .\start-docker.ps1
   ```

2. **Acceder a los servicios:**
   - **Aplicación**: http://localhost:8000
   - **Vite Dev Server**: http://localhost:3000  
   - **phpMyAdmin**: http://localhost:8080

### 💻 Desarrollo Local

1. **Instalación:**
   ```bash
   # Dependencias backend
   composer install
   
   # Dependencias frontend
   npm install
   ```

2. **Configuración:**
   ```bash
   # Configurar entorno
   cp .env.example .env
   php artisan key:generate
   
   # Configurar base de datos en .env
   # Ejecutar migraciones
   php artisan migrate
   ```

3. **Desarrollo:**
   ```powershell
   # Iniciar desarrollo local
   .\start-dev.ps1
   
   # O manualmente en terminales separadas:
   # Terminal 1: php artisan serve
   # Terminal 2: npm run dev
   ```

## Entorno Docker

### Servicios y Puertos

| Servicio | Puerto | URL | Descripción |
|----------|--------|-----|-------------|
| **Laravel App** | 8000 | http://localhost:8000 | Aplicación principal |
| **Vite Dev** | 3000 | http://localhost:3000 | Desarrollo frontend |
| **MySQL** | 3306 | - | Base de datos |
| **Redis** | 6379 | - | Cache y sesiones |
| **phpMyAdmin** | 8080 | http://localhost:8080 | Admin. base de datos |

### Gestión del Entorno

#### Scripts PowerShell
```powershell
# Iniciar entorno completo
.\start-docker.ps1

# Desarrollo local con hot reload  
.\start-dev.ps1

# Detener servicios
.\stop-docker.ps1

# Limpiar volúmenes y datos
.\clean-docker.ps1
```

#### Comandos Make (Alternativo)

```bash
make up       # Iniciar servicios
make down     # Detener servicios  
make build    # Construir imágenes
make restart  # Reiniciar servicios
make logs     # Ver logs en tiempo real
make shell    # Acceder al contenedor app
make clean    # Limpiar todo (volúmenes incluidos)
```

## Desarrollo y Scripts

### Frontend (React + TypeScript + Vite)

```bash
# Desarrollo con hot reload
npm run dev

# Build optimizado para producción
npm run build

# Preview del build de producción
npm run preview

# Verificación de tipos TypeScript
npm run type-check

# Linting y formateo
npm run lint
npm run lint:fix
```

### Backend (Laravel + PHP)

```bash
# Comandos Artisan principales
php artisan serve              # Servidor de desarrollo
php artisan migrate            # Ejecutar migraciones
php artisan migrate:fresh      # Reiniciar BD
php artisan tinker            # REPL de Laravel
php artisan route:list        # Listar rutas
php artisan config:cache      # Cache de configuración

# Desarrollo con Docker
docker-compose exec app php artisan migrate
docker-compose exec app php artisan tinker
```

## Configuración

### Variables de Entorno

#### Desarrollo Local (`.env`)
```env
APP_URL=http://localhost:8000
VITE_APP_URL="${APP_URL}"

DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=eunoia

REDIS_HOST=127.0.0.1
REDIS_PORT=6379
```

#### Desarrollo Docker (`.env.docker`)
```env
APP_URL=http://localhost:8000
VITE_APP_URL="${APP_URL}"

DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=eunoia

REDIS_HOST=redis
REDIS_PORT=6379
CACHE_STORE=redis
SESSION_DRIVER=redis
```

## Estructura del Proyecto

```
Eunoia/
├── 📁 app/                     # Backend Laravel
│   ├── Http/Controllers/       # Controladores API/Web
│   ├── Models/                 # Modelos Eloquent
│   └── Providers/             # Service providers
├── 📁 resources/
│   ├── js/                    # Frontend React + TypeScript
│   │   ├── Components/        # Componentes reutilizables
│   │   ├── Pages/             # Páginas principales
│   │   ├── types/             # Definiciones TypeScript
│   │   ├── hooks/             # Custom hooks React
│   │   └── utils/             # Funciones utilitarias
│   ├── css/                   # Sistema de estilos CSS
│   │   ├── app.css            # Variables y reset CSS
│   │   ├── components/        # Estilos de componentes
│   │   └── utils/             # Clases utilitarias
│   └── views/                 # Plantillas Blade
├── 📁 routes/                  # Definición de rutas
├── 📁 database/                # Migraciones y seeders
├── 📁 docker/                  # Configuración Docker
├── 🐳 docker-compose.yml       # Orquestación servicios
├── 🐳 Dockerfile               # Imagen app principal
├── ⚡ vite.config.js           # Configuración Vite
├── 🔧 tsconfig.json            # Configuración TypeScript
└── 📦 package.json             # Dependencias frontend
```

### Arquitectura Frontend

#### Sistema de Diseño CSS
- **Variables CSS**: Colores, tipografías, espaciado consistente
- **Componentes modulares**: Botones, cards, modals, alerts
- **Clases utilitarias**: Layout, spacing, text, flexbox
- **CSS puro**: Sin dependencias externas, optimizado para rendimiento

#### Estructura TypeScript
- **Tipado estricto**: Interfaces para props, API responses, modelos
- **Paths absolutos**: Imports limpia con `@/` y configuración tsconfig
- **Global types**: Definiciones compartidas en `resources/js/types/`
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
```

## Estado del Proyecto

### ✅ Backend Configurado
- Laravel 12.18.0 instalado y optimizado
- PHP 8.3+ con extensiones requeridas
- MySQL 8.0 como base de datos principal
- Redis para cache y sesiones
- Artisan commands funcionando correctamente

### ✅ Frontend Configurado  
- React 18+ con TypeScript estricto
- Vite como build tool con HMR
- Inertia.js para integración Laravel-React
- Sistema de diseño CSS modular
- Tipos TypeScript globales definidos

### ✅ Entorno de Desarrollo
- Docker Compose con servicios optimizados
- Scripts PowerShell para gestión rápida
- Hot Module Replacement (HMR) funcionando
- Volúmenes persistentes para base de datos
- phpMyAdmin para administración de BD

### ✅ Herramientas de Desarrollo
- TypeScript configurado con paths absolutos
- ESLint + Prettier para código consistente
- VS Code settings optimizadas
- Makefile para comandos Docker alternativos

## Solución de Problemas

### Problemas Comunes

#### Docker no inicia correctamente
```powershell
# Limpiar y reiniciar
.\clean-docker.ps1
.\start-docker.ps1
```

#### Frontend no actualiza (HMR)
```bash
# Verificar que Vite esté corriendo
npm run dev

# Verificar puerto 3000 disponible
netstat -ano | findstr :3000
```

#### Errores de TypeScript
```bash
# Verificar configuración
npm run type-check

# Revisar paths en tsconfig.json
# Verificar tipos globales en resources/js/types/
```

#### Base de datos no conecta
```bash
# Verificar servicios Docker
docker-compose ps

# Logs de MySQL
docker-compose logs mysql
```

## Próximos Pasos

### Desarrollo Backend
- [ ] Configurar modelos Eloquent principales
- [ ] Implementar sistema de autenticación
- [ ] Crear APIs RESTful
- [ ] Configurar migraciones y seeders

### Desarrollo Frontend  
- [ ] Implementar componentes UI principales
- [ ] Configurar gestión de estado (Context/Zustand)
- [ ] Integrar formularios con validación
- [ ] Implementar sistema de navegación

### DevOps y Producción
- [ ] Configurar pipeline CI/CD
- [ ] Optimizar Dockerfile para producción
- [ ] Configurar SSL/HTTPS
- [ ] Implementar monitoreo y logging

## Recursos y Documentación

### Documentación Oficial
- [Laravel 12 Documentation](https://laravel.com/docs/12.x)
- [React 18 Documentation](https://react.dev)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Vite Guide](https://vitejs.dev/guide/)
- [Inertia.js Documentation](https://inertiajs.com)

### Stack y Herramientas
- [Docker Compose Reference](https://docs.docker.com/compose/)
- [MySQL 8.0 Reference](https://dev.mysql.com/doc/refman/8.0/en/)
- [Redis Documentation](https://redis.io/docs/)

---

**Eunoia** - Desarrollado con ❤️ usando las mejores prácticas de desarrollo web moderno.  
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
