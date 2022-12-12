##################
# Variables
##################

DOCKER_COMPOSE = docker-compose -f ./_docker/docker-compose.yml --env-file ./_docker/.env
DOCKER_COMPOSE_EXEC = exec -u www-data php-fpm

PRINT_SEPARATOR = "\n"
PRINT_WELCOME1 = Welcome: http://localhost
PRINT_WELCOME2 = http://localhost/api/v1/hazardous
PRINT_WELCOME3 = http://localhost/api/v1/fastest?hazardous=false
PRINT_WELCOME4 = http://localhost/api/v1/fastest?hazardous=true
PRINT_SWAGGER = Swagger: http://localhost/api/documentation
PRINT_PHPMYADMIN = phpMyAdmin: http://localhost:4444

##################
# Docker compose
##################

build:
	${DOCKER_COMPOSE} build

start:
	${DOCKER_COMPOSE} start

stop:
	${DOCKER_COMPOSE} stop

up:
	${DOCKER_COMPOSE} up -d --remove-orphans

ps:
	${DOCKER_COMPOSE} ps

logs:
	${DOCKER_COMPOSE} logs -f

down:
	${DOCKER_COMPOSE} down -v --rmi=all --remove-orphans

restart:
	make stop start


##################
# App
##################

php:
	${DOCKER_COMPOSE} ${DOCKER_COMPOSE_EXEC}  bash

# all tests
test:
	${DOCKER_COMPOSE} ${DOCKER_COMPOSE_EXEC} php vendor/bin/phpunit

# Unit test
testu:
	${DOCKER_COMPOSE} ${DOCKER_COMPOSE_EXEC} php vendor/bin/phpunit ./tests/Unit

composer:
	${DOCKER_COMPOSE} ${DOCKER_COMPOSE_EXEC} composer install

##################
# Database
##################

db_migrate:
	${DOCKER_COMPOSE} ${DOCKER_COMPOSE_EXEC} php artisan migrate

db_seed:
	${DOCKER_COMPOSE} ${DOCKER_COMPOSE_EXEC} php artisan db:seed

db_add:
	make db_migrate db_seed

#################
#  Deployment
#################
dep:
	make build up composer pause10 db_add print

#################
# pause
#################

pause10:
	sleep 15

#################
# Hi
#################
print:
	@echo ${PRINT_SEPARATOR}
	@echo ${PRINT_WELCOME1}
	@echo ${PRINT_WELCOME2}
	@echo ${PRINT_WELCOME3}
	@echo ${PRINT_WELCOME4}
	@echo ${PRINT_SWAGGER}
	@echo ${PRINT_PHPMYADMIN}
	@echo ${PRINT_SEPARATOR}
