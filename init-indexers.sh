#!/bin/bash

mkdir -p /app/Definitions/Custom/

# Copy YGG-API indexer
echo "Installing YGG-API indexer definition..."
cp /app/indexer-definitions/ygg-api-download.yml /app/Definitions/Custom/

# Copy ygege indexer
echo "Installing ygege indexer definition..."
cp /app/indexer-definitions/ygege.yml /app/Definitions/Custom/

chown -R hotio:hotio /app/Definitions/
chmod -R 755 /app/Definitions/

echo "Indexers installed successfully (YGG-API, ygege)"

# Execute the original entrypoint with all arguments
exec /init "$@"