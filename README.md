# The PostgreSQL Dump Maker

[![](https://images.microbadger.com/badges/version/mailtop/postgres-dump-maker.svg)](https://microbadger.com/images/mailtop/postgres-dump-maker "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/mailtop/postgres-dump-maker.svg)](https://microbadger.com/images/mailtop/postgres-dump-maker "Get your own image badge on microbadger.com")

This image creates a database dump, compress it, and send to an S3 bucket.

* Based on `postgres:9.6-alpine`
* Contains aws-cli v1.11.160

## Usage example

```
docker run -it --rm \
  -e POSTGRES_HOST="hostname or IP" \
  -e POSTGRES_USER="user name" \
  -e POSTGRES_PASSWORD="secret password" \
  -e POSTGRES_DB="database name" \
  -e AWS_ACCESS_KEY_ID="access key" \
  -e AWS_SECRET_ACCESS_KEY="access secret" \
  -e AWS_REGION="your region" \
  -e AWS_S3_BUCKET="s3://bucket name" \ # without the final /
  mailtop/postgres-dump-maker
```

[Docker Hub](https://hub.docker.com/r/mailtop/postgres-dump-maker)
