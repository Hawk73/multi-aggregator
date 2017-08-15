.PHONY: bash
.PHONY: build
.PHONY: build-db
.PHONY: build-force
.PHONY: dev_reinstall
.PHONY: down
.PHONY: image
.PHONY: inspect
.PHONY: migrate
.PHONY: seed
.PHONY: tests
.PHONY: up


# DB
build-db:
	docker-compose exec app bash -l -c "bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed"

migrate:
	docker-compose exec app bash -l -c "bundle exec rake db:migrate"

seed:
	docker-compose exec app bash -l -c "bundle exec rake db:seed"


# Docker #
bash:
	docker-compose exec app /bin/bash

build:
	docker-compose -f docker-compose.yml build

build-force:
	docker-compose -f docker-compose.yml build --force-rm

down:
	docker-compose -f docker-compose.yml down -v --remove-orphans

image:
	./docker/build_image.sh

up:
	docker-compose -f docker-compose.yml up


# Other #
dev_reinstall:
	./scripts/dev_reinstall.sh

# Tests #
inspect:
	./docker/run_rubocop.sh

tests:
	./docker/run_tests.sh
