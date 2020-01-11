IMAGE_BASENAME := attakei-local/django-singleton

PACKAGE = dist/webapp-0.1.0-py3-none-any.whl
SOURCES = webapp/*.py

$(PACKAGE): $(SOURCES)
	poetry build

poetry: $(PACKAGE)

docker-unit: poetry
	docker build -t $(IMAGE_BASENAME):unit -f container-unit/Dockerfile .

build: docker-unit

