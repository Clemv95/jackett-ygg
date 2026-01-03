#!/bin/bash

mkdir -p /app/Definitions/

# Copy YGG-API indexer
echo "Installing YGG-API indexer definition..."
cp /app/indexer-definitions/ygg-api-download.yml /app/Definitions/

# Copy ygege indexer
echo "Installing ygege indexer definition..."
cp /app/indexer-definitions/ygege.yml /app/Definitions/

# Copy lacale indexer
echo "Installing lacale indexer definition..."
cp /app/indexer-definitions/lacale-api.yml /app/Definitions/

chown -R hotio:hotio /app/Definitions/
chmod -R 755 /app/Definitions/

echo "Indexers installed successfully (YGG-API, ygege,lacale)"

# Execute the original entrypoint with all arguments
exec dotnet /app/Jackett.dll "$@"