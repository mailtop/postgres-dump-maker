#!/bin/bash
set -e

FILE="$(date +%Y%m%d%H%M%S)-$POSTGRES_DB.out"

echo "Creating file $FILE..."
PGPASSWORD="$POSTGRES_PASSWORD" pg_dump -U $POSTGRES_USER \
                                        -h $POSTGRES_HOST \
                                        -d $POSTGRES_DB > $FILE

echo "Compressing to $FILE.bz2..."
bzip2 -9 $FILE

echo "Uploading to $AWS_S3_BUCKET..."
aws s3 cp $FILE.bz2 $AWS_S3_BUCKET/$FILE.bz2

echo "Done."
exit 0
