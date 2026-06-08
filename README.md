# sqlite-backup

Backs up a SQLite database to S3-compatible storage using `sqlite3 .backup`, compresses with `zstd`, and uploads via `aws s3 sync`.

## Usage

```sh
podman run --rm \
  -v /path/to/data:/data \
  -e DB_PATH=/data/app.db \
  -e S3_BUCKET=my-bucket \
  -e AWS_ACCESS_KEY_ID=... \
  -e AWS_SECRET_ACCESS_KEY=... \
  -e AWS_DEFAULT_REGION=... \
  -e AWS_ENDPOINT_URL=... \
  sqlite-backup
```

## Environment variables

| Variable | Required | Description |
|----------|----------|-------------|
| `DB_PATH` | yes | Path to the SQLite database file |
| `S3_BUCKET` | yes | S3 bucket name |
| `AWS_ACCESS_KEY_ID` | yes | S3 credentials |
| `AWS_SECRET_ACCESS_KEY` | yes | S3 credentials |
| `AWS_DEFAULT_REGION` | no | S3 region |
| `AWS_ENDPOINT_URL` | no | S3-compatible endpoint |
