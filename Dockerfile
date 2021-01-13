FROM python:3.6-alpine
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app/
COPY ./requirements.txt .

RUN apk update \
    && apk add --no-cache postgresql-client curl \
    && apk add --update --no-cache --virtual .build-deps gcc python3-dev musl-dev postgresql-dev \
    && pip install -r requirements.txt \
    && apk del .build-deps

COPY . /app/
RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT /app/docker-entrypoint.sh
