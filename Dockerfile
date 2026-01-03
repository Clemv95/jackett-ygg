FROM ghcr.io/clemv95/jackett-ygg-nonturbo:latest

USER root

# Build args to bust cache when dependencies change
ARG GIST_HASH=unknown

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Download YGG-API indexer
RUN echo "Fetching YGG-API gist hash: ${GIST_HASH}" && \
    mkdir -p /Clemv95 && \
    git clone https://gist.github.com/8bfded23ef23ec78f6678896f42a2b60.git /Clemv95/ygg-api && \
    mkdir -p /app/indexer-definitions && \
    cp /Clemv95/ygg-api/ygg-api-download.yml /app/indexer-definitions/ && \
    rm -rf /Clemv95


# Download ygege indexer
RUN git clone https://github.com/UwUDev/ygege.git /tmp/ygege && \
    cp /tmp/ygege/ygege.yml /app/indexer-definitions/ && \
    rm -rf /tmp/ygege


# Download lacale indexer
RUN wget https://github.com/JigSawFr/lacale-prowlarr-indexer/blob/b36eb7e56e4d350f75c0540fa78a2b502c023218/lacale-api.yml -O /app/indexer-definitions/lacale-api.yml


# Copy init script and make it executable
COPY init-indexers.sh /app/init-indexers.sh
RUN chmod +x /app/init-indexers.sh /entrypoint.sh && \
    chown -R 1000:1000 /app/indexer-definitions /app/init-indexers.sh

VOLUME /config
EXPOSE 9117


ENTRYPOINT ["/entrypoint.sh"]
CMD ["/app/init-indexers.sh"]