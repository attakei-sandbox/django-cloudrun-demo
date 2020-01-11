FROM python:3.7-slim as build
ARG DJANGO_STATIC_ROOT=/app/static

RUN mkdir /app
COPY dist/webapp-0.1.0-py3-none-any.whl /app/
COPY manage.py /app/

WORKDIR /app
RUN python -m venv /venv \
    && /venv/bin/pip install /app/webapp-0.1.0-py3-none-any.whl \
    && /venv/bin/python manage.py collectstatic --no-input

FROM nginx/unit:1.14.0-python3.7

COPY --from=build /venv/lib/python3.7/site-packages/ /usr/lib/python3.7/site-packages
COPY --from=build /app /app
COPY container-unit/unit.config.json /docker-entrypoint.d/
