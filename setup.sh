#!/bin/sh -x

docker-compose down
docker-compose build 
docker-compose up -d 
docker-compose exec web sh -c "rails db:reset"
docker-compose exec web sh -c "rails db:migrate VERSION=0"
docker-compose exec web sh -c "rails db:create db:migrate db:seed"

sudo chmod -R 0777 .
