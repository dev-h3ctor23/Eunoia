#!/usr/bin/env pwsh

# Script para iniciar el entorno de desarrollo con Docker
Write-Host "Iniciando Eunoia con Docker..." -ForegroundColor Cyan

# Detener contenedores existentes
Write-Host "Deteniendo contenedores existentes..." -ForegroundColor Yellow
docker-compose down

# Construir e iniciar contenedores
Write-Host "Construyendo e iniciando contenedores..." -ForegroundColor Yellow
docker-compose up --build -d

# Esperar a que los servicios estén listos
Write-Host "Esperando a que los servicios estén listos..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Mostrar el estado de los contenedores
Write-Host "Estado de los contenedores:" -ForegroundColor Green
docker-compose ps

Write-Host ""
Write-Host "Entorno Docker iniciado!" -ForegroundColor Green
Write-Host "Laravel: http://localhost:8000" -ForegroundColor Cyan
Write-Host "Vite Dev Server: http://localhost:3000" -ForegroundColor Cyan
Write-Host "PhpMyAdmin: http://localhost:8080" -ForegroundColor Cyan
Write-Host ""
Write-Host "Comandos útiles:" -ForegroundColor Yellow
Write-Host "  docker-compose logs -f app   # Ver logs de la aplicación"
Write-Host "  docker-compose exec app bash # Acceder al contenedor"
Write-Host "  docker-compose down          # Detener todos los servicios"
Write-Host ""
