#!/bin/sh
set -e

if [ -z "$DB_PATH" ]; then
  echo "DB_PATH must be set" >&2
  exit 1
fi

if [ -z "$S3_BUCKET" ]; then
  echo "S3_BUCKET must be set" >&2
  exit 1
fi

sqlite3 "$DB_PATH" ".backup /tmp/db.sqlite3"
zstd --rm /tmp/db.sqlite3
aws s3 sync /tmp "s3://$S3_BUCKET"
