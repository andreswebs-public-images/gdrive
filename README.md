# gdrive

Google Drive CLI.

## Run

```sh
export SERVICE_ACCOUNT_FILE="example.json"
export GDRIVE_VOLUME="/tmp/gdrive"
```

Init:

```sh
docker run -it --rm \
    --platform linux/amd64 \
    --volume "${GDRIVE_VOLUME}:/var/lib/gdrive" \
    --volume "${SERVICE_ACCOUNT_FILE}:/gcp/credentials.json" \
    andreswebs/gdrive init \
      --service-account-file /gcp/credentials.json /var/lib/gdrive
```

```sh
docker run -it --rm \
    --platform linux/amd64 \
    --volume "${GDRIVE_VOLUME}:/var/lib/gdrive" \
    andreswebs/gdrive -h
```

## Authors

**Andre Silva** [andreswebs](https://github.com/andreswebs/)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).
