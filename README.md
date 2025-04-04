# Minio

Minio cluster behind nginx-proxy

## Instructions to use

- copy `scripts/.env.example` to `scripts/.env` and edit it to match your settings
- change other env variables to your needs
- if necessary modify `scripts/nginx/custom.conf` to match you `DOMAIN_HOST`
- run `sh scripts/start.sh` to start the project
- run `sh scripts/stop.sh` to stop the project
- run `sh scripts/build.sh` to build or rebuild the project
- run `sh scripts/restart.sh` to restart containers
- navigate to `DOMAIN_HOST` and setup buckets and access keys
- where you use, for example in Laravel you need to add extra:

    - AWS_URL=http(s)://<DOMAIN_HOST>/<bucket>
    - AWS_ENDPOINT=http(s)://<DOMAIN_HOST>
    - AWS_BUCKET=<bucket>
    - AWS_USE_PATH_STYLE_ENDPOINT=true

- If you have a private dns, you have to pass EXTRA_HOST on you application that `DOMAIN_HOST` is `nginx-proxy` gateway

## Bucket configs

- buckets should be named: `bucket-<name>`, this is a known restriction
- Example for custom policy you can set for a bucket to be private but object to be public visible:

      {
          "Version": "2012-10-17",
          "Statement": [
              {
                  "Effect": "Allow",
                  "Principal": {
                      "AWS": [
                          "*"
                      ]
                  },
                  "Action": [
                      "s3:GetObject"
                  ],
                  "Resource": [
                      "arn:aws:s3:::*"
                  ]
              }
          ]
      }

## Dependencies

- `nginx-proxy` - https://github.com/ionghitun/nginx-proxy

_Happy Coding!_
