# Minio Docker Stack

A distributed MinIO cluster configured behind nginx and [nginx-proxy](https://github.com/ionghitun/nginx-proxy).

## Prerequisites

- Docker Engine & Docker Compose
- Git
- Linux or Windows WSL2
- A working nginx-proxy network (see [nginx-proxy setup](https://github.com/ionghitun/nginx-proxy))

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ionghitun/minio.git
   cd minio
   ```
2. **Copy and configure environment variables**
   ```bash
   cp scripts/.env.example scripts/.env
   # Edit other variables in scripts/.env as needed
   ```
3. **Update virtual host configuration**
   - Modify `scripts/nginx/custom.conf` to match your `DOMAIN_HOST`.
4. **Start the project**
   ```bash
   sh scripts/start.sh
   ```
5. **Access Minio**
   - Open your browser and navigate to your configured `DOMAIN_HOST` (e.g., https://minio.dev.local).

## Available scripts

```bash
./scripts/start.sh    # Start the containers
./scripts/down.sh     # Stop the containers
./scripts/build.sh    # Build or rebuild the containers
./scripts/restart.sh  # Restart the containers
```

## Bucket Configuration

- Buckets must follow the pattern: `bucket-<name>`.
- Example policy to allow public object access while keeping the bucket private:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {"AWS": ["*"]},
      "Action": ["s3:GetObject"],
      "Resource": ["arn:aws:s3:::*"]
    }
  ]
}
```

## Laravel Integration

For example, in Laravel `.env`:

```dotenv
AWS_URL=https://<DOMAIN_HOST>/<bucket>
AWS_ENDPOINT=https://<DOMAIN_HOST>
AWS_ACCESS_KEY_ID=<generated-key-id>
AWS_SECRET_ACCESS_KEY=<generated-access-key>
AWS_DEFAULT_REGION=<configured-redion>
AWS_BUCKET=<bucket>
AWS_USE_PATH_STYLE_ENDPOINT=true
```

If you're using a private DNS, your application may need:
```yaml
extra_hosts:
  - "<DOMAIN_HOST>:<gateway_ip_of_nginx_proxy>"
```

## Troubleshooting

- **Docker Issues**: For older versions you might want to remove `COMPOSE_BAKE` from `.env`.
- **Docker Compose Issues**: Please update and ensure you can use `docker compose`, not old version `docker-compose`

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome! Please open issues or submit pull requests following the repository guidelines.

_Happy Coding_
