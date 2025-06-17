# Comandos Docker para Eunoia
# Uso: make <comando>

.PHONY: help build up down restart logs shell clean

# Comando por defecto
help:
	@echo "Comandos disponibles para Eunoia Docker:"
	@echo "  make build    - Construir las imágenes Docker"
	@echo "  make up       - Iniciar todos los servicios"
	@echo "  make down     - Detener todos los servicios"
	@echo "  make restart  - Reiniciar todos los servicios"
	@echo "  make logs     - Ver logs de todos los servicios"
	@echo "  make shell    - Acceder al shell del contenedor de la app"
	@echo "  make clean    - Limpiar contenedores e imágenes"

# Construir imágenes
build:
	docker-compose build --no-cache

# Iniciar servicios en segundo plano
up:
	docker-compose up -d

# Detener servicios
down:
	docker-compose down

# Reiniciar servicios
restart: down up

# Ver logs
logs:
	docker-compose logs -f

# Acceder al shell del contenedor
shell:
	docker-compose exec app sh

# Limpiar todo
clean:
	docker-compose down -v
	docker system prune -af
