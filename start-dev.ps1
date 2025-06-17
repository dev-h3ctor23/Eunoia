# Script para levantar Laravel y Vite en desarrollo

Write-Host "Iniciando servidores de desarrollo..." -ForegroundColor Green

# Levantar Laravel en puerto 8000 en background
Write-Host "Levantando Laravel en puerto 8000..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd 'c:\Users\chang\Desktop\Eunoia'; php artisan serve --host=127.0.0.1 --port=8000"

# Esperar un poco antes de levantar Vite
Start-Sleep -Seconds 3

# Levantar Vite en puerto 3000 en background
Write-Host "Levantando Vite en puerto 3000..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd 'c:\Users\chang\Desktop\Eunoia'; npm run dev"

Write-Host "Servidores iniciados:" -ForegroundColor Green
Write-Host "- Laravel: http://127.0.0.1:8000" -ForegroundColor Cyan
Write-Host "- Vite Dev Server: http://127.0.0.1:3000" -ForegroundColor Cyan

Write-Host "Presiona cualquier tecla para salir..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
