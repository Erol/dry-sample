build:
	docker-compose build bundler
	docker-compose run --rm bundler ./.bundle.sh
	docker-compose build app

migrate:
	docker-compose run --rm app bin/rails db:create db:migrate

console:
	docker-compose run --rm app bin/rails console

shell:
	docker-compose run --rm app sh