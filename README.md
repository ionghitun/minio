# Minio

Minio cluster behind nginx-proxy

## Instructions to use

- copy `.env.example` to `.env` and edit it to match your settings
- run `docker-compose up -d` to bring up containers
- navigate to `DOMAIN_HOST` and setup buckets and access keys
- where you use, for example in Laravel you need to add extra:

    - AWS_URL=http(s)://<DOMAIN_HOST>/bucket
    - AWS_ENDPOINT=http(s)://<DOMAIN_HOST>/bucket

## Dependencies

- `nginx-proxy` - https://github.com/ionghitun/nginx-proxy
