#!/usr/bin/env pwsh

# Script para verificar que todos los servicios Docker estén funcionando correctamente
Write-Host "🔍 Verificando servicios de Eunoia..." -ForegroundColor Yellow

# Función para verificar si Docker está ejecutándose
function Test-DockerRunning {
    try {
        docker version | Out-Null
        return $true
    } catch {
        return $false
    }
}

# Verificar que Docker esté ejecutándose
if (-not (Test-DockerRunning)) {
    Write-Host "❌ Docker no está ejecutándose. Por favor, inicia Docker Desktop." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Docker está ejecutándose" -ForegroundColor Green

# 1. Estado de contenedores
Write-Host "`n📦 Estado de contenedores:" -ForegroundColor Cyan
$containers = docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | Where-Object { $_ -match "eunoia" }

if ($containers) {
    $containers | ForEach-Object { Write-Host "  $_" }
} else {
    Write-Host "  ❌ No hay contenedores de Eunoia ejecutándose" -ForegroundColor Red
    Write-Host "     Ejecuta .\start-docker.ps1 para iniciar los servicios" -ForegroundColor Yellow
    exit 1
}

# 2. Verificar Redis
Write-Host "`n🔴 Verificando Redis:" -ForegroundColor Cyan
try {
    $redisResponse = docker exec eunoia-redis-1 redis-cli ping 2>$null
    if ($redisResponse -eq "PONG") {
        Write-Host "  ✅ Redis está funcionando correctamente" -ForegroundColor Green
    } else {
        Write-Host "  ❌ Redis no está respondiendo" -ForegroundColor Red
    }
} catch {
    Write-Host "  ❌ No se puede conectar a Redis" -ForegroundColor Red
}

# 3. Verificar MySQL
Write-Host "`n🗄️ Verificando MySQL:" -ForegroundColor Cyan
try {
    $mysqlResponse = docker exec eunoia-mysql-1 mysql -u root -ppassword -e "SELECT 1;" 2>$null
    if ($mysqlResponse -match "1") {
        Write-Host "  ✅ MySQL está funcionando correctamente" -ForegroundColor Green
        
        # Verificar que la base de datos eunoia existe
        $dbCheck = docker exec eunoia-mysql-1 mysql -u root -ppassword -e "SHOW DATABASES;" 2>$null
        if ($dbCheck -match "eunoia") {
            Write-Host "  ✅ Base de datos 'eunoia' existe" -ForegroundColor Green
        } else {
            Write-Host "  ⚠️ Base de datos 'eunoia' no encontrada" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  ❌ MySQL no está respondiendo" -ForegroundColor Red
    }
} catch {
    Write-Host "  ❌ No se puede conectar a MySQL" -ForegroundColor Red
}

# 4. Verificar phpMyAdmin
Write-Host "`n🌐 Verificando phpMyAdmin:" -ForegroundColor Cyan
try {
    $phpmyadminStatus = docker ps --filter "name=eunoia-phpmyadmin-1" --format "{{.Status}}"
    if ($phpmyadminStatus -match "Up") {
        Write-Host "  ✅ phpMyAdmin está ejecutándose" -ForegroundColor Green
        
        # Verificar que el puerto 8080 esté disponible
        $portCheck = netstat -ano | findstr ":8080"
        if ($portCheck) {
            Write-Host "  ✅ Puerto 8080 está disponible para phpMyAdmin" -ForegroundColor Green
        } else {
            Write-Host "  ⚠️ Puerto 8080 no está disponible" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  ❌ phpMyAdmin no está ejecutándose" -ForegroundColor Red
    }
} catch {
    Write-Host "  ❌ Error verificando phpMyAdmin" -ForegroundColor Red
}

# 5. Verificar conectividad de puertos
Write-Host "`n🔌 Verificando puertos:" -ForegroundColor Cyan
$ports = @{
    "8000" = "Laravel"
    "3000" = "Vite Dev Server" 
    "8080" = "phpMyAdmin"
    "3306" = "MySQL"
    "6379" = "Redis"
}

foreach ($port in $ports.Keys) {
    $service = $ports[$port]
    $portCheck = netstat -ano | findstr ":$port"
    if ($portCheck) {
        Write-Host "  ✅ Puerto $port ($service) está en uso" -ForegroundColor Green
    } else {
        Write-Host "  ❌ Puerto $port ($service) no está en uso" -ForegroundColor Red
    }
}

# 6. URLs de acceso
Write-Host "`n🌐 URLs de acceso:" -ForegroundColor Green
Write-Host "  🌐 Laravel: http://localhost:8000" -ForegroundColor Cyan
Write-Host "  ⚡ Vite Dev: http://localhost:3000" -ForegroundColor Cyan
Write-Host "  🗄️ phpMyAdmin: http://localhost:8080" -ForegroundColor Cyan
Write-Host "     Usuario: root | Contraseña: password" -ForegroundColor Gray

# 7. Comandos útiles
Write-Host "`n🛠️ Comandos útiles:" -ForegroundColor Yellow
Write-Host "  docker-compose logs -f app        # Ver logs de la aplicación"
Write-Host "  docker-compose exec app bash      # Acceder al contenedor"
Write-Host "  docker-compose restart [servicio] # Reiniciar un servicio específico"
Write-Host "  .\stop-docker.ps1                 # Detener todos los servicios"

Write-Host "`n✅ Verificación completada!" -ForegroundColor Green
