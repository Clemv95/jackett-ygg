#!/bin/bash


# Copy YGG-API indexer
echo "Installing YGG-API indexer definition..."
cp /app/indexer-definitions/ygg-api-download.yml /app/Definitions/

echo "Indexers installed successfully (YGG-API)"

# Execute the original entrypoint with all arguments
exec /init "$@"
