# Minio

Minio cluster behind nginx-proxy

## Instructions to use

- copy `.env.example` to `.env` and edit it to match your settings
- if necessary modify `docker/nginx/custom_dev.conf` to match you `DOMAIN_HOST`
- run `docker-compose up -d` to bring up containers
- navigate to console from `DOMAIN_HOST` and setup buckets and access keys
- where you use, for example in Laravel you need to add extra:

    - AWS_URL=http(s)://<DOMAIN_HOST>/bucket
    - AWS_ENDPOINT=http(s)://<DOMAIN_HOST>
    - AWS_USE_PATH_STYLE_ENDPOINT=true

## Dependencies

- `nginx-proxy` - https://github.com/ionghitun/nginx-proxy
