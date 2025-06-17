#!/usr/bin/env pwsh

# Script para detener el entorno de desarrollo con Docker
Write-Host "🛑 Deteniendo entorno Docker de Eunoia..." -ForegroundColor Red

# Detener y remover contenedores
docker-compose down

Write-Host "✅ Entorno Docker detenido correctamente" -ForegroundColor Green
