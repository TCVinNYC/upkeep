dev:
	docker compose -p upkeep -f ./docker/docker-compose.yml up --build --remove-orphans || make dev-down

dev-down:
	docker compose -f ./docker/docker-compose.yml down --remove-orphans

.PHONY: open-api
open-api:
	cd ./open-api && bash ./bin/generate-open-api.sh

open-api-dart:
	cd ./open-api && bash ./bin/generate-open-api.sh dart

open-api-typescript:
	cd ./open-api && bash ./bin/generate-open-api.sh typescript


clean:
	find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
	find . -name "dist" -type d -prune -exec rm -rf '{}' +
	find . -name "build" -type d -prune -exec rm -rf '{}' +
	find . -name "svelte-kit" -type d -prune -exec rm -rf '{}' +
	docker compose -f ./docker/docker-compose.dev.yml rm -v -f || true