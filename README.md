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

#### Configuración de Build
- `vite.config.js` - Configuración del bundler Vite
- `tsconfig.json` - Configuración TypeScript para frontend
- `tsconfig.node.json` - Configuración TypeScript para herramientas
- `package.json` - Dependencias y scripts de Node.js

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

### Backend
- Laravel 12.18.0 instalado y optimizado
- PHP 8.3+ con extensiones requeridas
- MySQL 8.0 como base de datos principal
- Redis para cache y sesiones
- Artisan commands funcionando correctamente

### Frontend
- React 18+ con TypeScript estricto
- Vite como build tool con HMR
- Inertia.js para integración Laravel-React
- Sistema de diseño CSS modular
- Tipos TypeScript globales definidos

### Entorno de Desarrollo
- Docker Compose con servicios optimizados
- Scripts PowerShell para gestión rápida
- Hot Module Replacement (HMR) funcionando
- Volúmenes persistentes para base de datos
- phpMyAdmin para administración de BD

### Herramientas de Desarrollo
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

#### Verificación de Servicios phpMyAdmin y Redis

**Verificar que todos los servicios estén ejecutándose:**
```powershell
# Ver estado de contenedores
docker ps

# Verificar servicios específicos
docker-compose ps mysql redis phpmyadmin
```

**Verificar conectividad de Redis:**
```powershell
# Ping a Redis directamente
docker exec eunoia-redis-1 redis-cli ping
# Respuesta esperada: PONG

# Verificar desde la aplicación Laravel
docker-compose exec app php artisan tinker
# En tinker: Redis::ping()
```

**Verificar phpMyAdmin:**
```powershell
# Verificar logs de phpMyAdmin
docker logs eunoia-phpmyadmin-1 --tail 10

# Acceder a phpMyAdmin en el navegador
# URL: http://localhost:8080
# Usuario: root
# Contraseña: password
```

**Verificar conectividad de MySQL:**
```powershell
# Conectar a MySQL directamente
docker exec eunoia-mysql-1 mysql -u root -ppassword -e "SELECT 1;"

# Verificar que la base de datos 'eunoia' existe
docker exec eunoia-mysql-1 mysql -u root -ppassword -e "SHOW DATABASES;"
```

**Solución a problemas comunes:**

1. **Error: Extension Redis ya instalada en Dockerfile**
   - ✅ **Solucionado**: El Dockerfile ahora maneja este caso automáticamente
   - Si persiste, reconstruir la imagen: `docker-compose build --no-cache app`

2. **phpMyAdmin no carga**
   ```powershell
   # Reiniciar solo phpMyAdmin
   docker-compose restart phpmyadmin
   
   # Verificar que MySQL esté saludable
   docker ps  # Buscar "(healthy)" en la columna STATUS
   ```

3. **Redis no conecta desde la aplicación**
   ```powershell
   # Verificar configuración en .env.docker
   # REDIS_HOST=redis
   # REDIS_PORT=6379
   
   # Reiniciar Redis
   docker-compose restart redis
   ```

4. **Puertos en uso**
   ```powershell
   # Verificar puertos utilizados
   netstat -ano | findstr ":8080"  # phpMyAdmin
   netstat -ano | findstr ":6379"  # Redis
   netstat -ano | findstr ":3306"  # MySQL
   ```

**Script de verificación completa:**
```powershell
# Ejecutar verificación completa de servicios
.\verify-services.ps1
```

### Trabajando con Redis y phpMyAdmin

#### Comandos Redis en Consola

**Acceso directo a Redis CLI:**
```powershell
# Entrar en modo interactivo
docker exec -it eunoia-redis-1 redis-cli

# Comandos básicos de prueba
docker exec eunoia-redis-1 redis-cli ping                    # PONG
docker exec eunoia-redis-1 redis-cli set "clave" "valor"     # OK
docker exec eunoia-redis-1 redis-cli get "clave"             # valor
docker exec eunoia-redis-1 redis-cli keys "*"                # Listar todas las claves
docker exec eunoia-redis-1 redis-cli info server             # Información del servidor
```

**Comandos útiles para desarrollo:**
```powershell
# Limpiar cache de Laravel a través de Redis
docker exec eunoia-redis-1 redis-cli FLUSHDB

# Ver estadísticas de Redis
docker exec eunoia-redis-1 redis-cli info stats

# Monitorear comandos en tiempo real
docker exec eunoia-redis-1 redis-cli monitor
```

#### Acceso a phpMyAdmin

**URL de acceso:** http://localhost:8080

**Credenciales:**
- **Servidor:** `mysql` (se conecta automáticamente)
- **Usuario:** `root`
- **Contraseña:** `password`

**Tareas comunes en phpMyAdmin:**
1. **Explorar la base de datos `eunoia`**
2. **Ejecutar consultas SQL personalizadas**
3. **Importar/Exportar datos**
4. **Crear tablas adicionales para desarrollo**
5. **Monitorear consultas y rendimiento**

**Solución si phpMyAdmin no carga:**
```powershell
# Reiniciar phpMyAdmin
docker-compose restart phpmyadmin

# Verificar que MySQL esté saludable
docker ps | findstr mysql
# Debe mostrar "(healthy)" en el STATUS
```

## Próximos Pasos

### Backend
1. ✅ ~~Configurar base de datos (MySQL, PostgreSQL, etc.)~~ - **Completado con Docker**
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

### DevOps y Producción
- [ ] Configurar pipeline CI/CD
- [ ] Optimizar Dockerfile para producción
- [ ] Configurar SSL/HTTPS
- [ ] Implementar monitoreo y logging

### Integración
1. Conectar frontend React con APIs de Laravel
2. Implementar manejo de errores global
3. Configurar interceptors para autenticación
4. Optimizar build para producción
5. Configurar CI/CD pipeline

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

**Eunoia** - Desarrollado usando las mejores prácticas de desarrollo web moderno.

### Configuración Completa
- TypeScript 5.8.3 con configuración optimizada  
- CSS Puro configurado con sistema de diseño modular  
- Vite 6.2.4 como build tool y dev server  
- Estructura de directorios frontend organizada  
- Alias de imports configurados (@/...)  
- Testing setup con Vitest 3.2.3  
- Linting configurado con Oxlint  

### Infraestructura Docker
- Docker Desktop configurado y funcionando  
- MySQL 8.0 ejecutándose (Puerto 3306)  
- Redis 7.4.4 ejecutándose (Puerto 6379)  
- phpMyAdmin accesible en http://localhost:8080  
- Conectividad Redis verificada (PING/PONG funcionando)  
- Base de datos MySQL operativa y saludable  
- Dockerfile optimizado y libre de vulnerabilidades  
- Script de verificación de servicios (`verify-services.ps1`)  
- Documentación completa para Redis CLI y phpMyAdmin  

### Servicios Verificados
- **Redis**: Respondiendo correctamente, CLI accesible
- **MySQL**: Conexión estable, base de datos 'eunoia' creada
- **phpMyAdmin**: Interfaz web accesible, conectado a MySQL
- **Puertos**: 3306, 6379, 8080 operativos  

---

**Versión Laravel:** 12.18.0  
**Versión PHP:** 8.3.11  
**Docker:** 28.0.4  
**MySQL:** 8.0.42  
**Redis:** 7.4.4  
**Fecha de instalación:** 17 de junio de 2025  
**Última actualización:** 17 de junio de 2025
