# Jackett with YGGTorrent Indexers

Thanks to @almottier for making the Prowlarr version, i've forked his repo to make the same thing to Jackett

[![Auto Rebuild](https://github.com/clemv95/jackett-ygg/actions/workflows/auto-rebuild.yml/badge.svg)](https://github.com/clemv95/jackett-ygg/actions/workflows/auto-rebuild.yml)

An up-to-date Prowlarr Docker image with YGGTorrent indexers (Ygg-API and Ygege) pre-installed.

```text
ghcr.io/clemv95/jackett-ygg
```

## Features

- Based on the latest [hotio/jackett](https://hotio.dev/containers/jackett/) image
- Two YGGTorrent indexers pre-installed in `/app/Definitions/`:
  - [Clemv95/Ygg-API](https://gist.github.com/Clemv95/8bfded23ef23ec78f6678896f42a2b60) using [yggapi](https://yggapi.eu/)
  - [UwUDev/ygege](https://github.com/UwUDev/ygege): see [ygege docker guide](https://github.com/UwUDev/ygege/blob/develop/docs/docker-guide.md) for docker setup
- Automatically rebuilds when the base image or either indexer is updated
- Ready to use after container startup

## Usage

### cli

```bash
docker run --rm \
    --name jackett \
    -p 9696:9696 \
    -e PUID=1000 \
    -e PGID=1000 \
    -e UMASK=002 \
    -e TZ="Europe/Paris" \
    -v /<host_folder_config>:/config \
    ghcr.io/clemv95/jackett-ygg
```

### compose

```yaml
services:
  prowlarr:
    container_name: jackett
    image: ghcr.io/clemv95/jackett-ygg
    ports:
      - "9696:9696"
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Paris
    volumes:
      - /<host_folder_config>:/config
```

## Configuration

After starting the container, both YGGTorrent indexers (Ygg-API and ygege) will be available in Jackett's indexer settings:

![](./Screenshot.png)
