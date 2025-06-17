#!/usr/bin/env pwsh

# Script para limpiar completamente el entorno Docker
Write-Host "🧹 Limpiando entorno Docker de Eunoia..." -ForegroundColor Yellow

# Detener todos los contenedores
Write-Host "📦 Deteniendo contenedores..." -ForegroundColor Yellow
docker-compose down

# Remover volúmenes (esto eliminará la base de datos)
$response = Read-Host "¿Deseas eliminar todos los datos (base de datos, Redis)? (y/N)"
if ($response -eq "y" -or $response -eq "Y") {
    Write-Host "🗑️  Eliminando volúmenes..." -ForegroundColor Red
    docker-compose down -v
    docker volume prune -f
}

# Limpiar imágenes no utilizadas
Write-Host "🖼️  Limpiando imágenes no utilizadas..." -ForegroundColor Yellow
docker image prune -f

# Limpiar caché de build
Write-Host "💾 Limpiando caché de build..." -ForegroundColor Yellow
docker builder prune -f

Write-Host "✅ Limpieza completada" -ForegroundColor Green
