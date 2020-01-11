PACKAGE = dist/webapp-0.1.0-py3-none-any.whl
SOURCES = webapp/*.py

$(PACKAGE): $(SOURCES)
	poetry build

build: $(PACKAGE)
