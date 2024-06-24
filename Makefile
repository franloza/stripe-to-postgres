.DEFAULT_GOAL := run
IMAGE_NAME=stripe-to-postgres

run:
	python stripe_analytics_pipeline.py full_load --skip-incremental-endpoints
	python stripe_analytics_pipeline.py incremental_load

setup:
	python -m venv venv
	. venv/bin/activate; pip install -r requirements.txt

build:
	docker build -t $(IMAGE_NAME) .

docker-run:
	docker run --rm --env-file .env $(IMAGE_NAME) full_load --skip-incremental-endpoints
	docker run --rm --env-file .env $(IMAGE_NAME) incremental_load
