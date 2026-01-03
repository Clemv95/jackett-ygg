#!/bin/bash
set -e

# Créer les répertoires nécessaires
mkdir -p /config/Jackett/Indexers
mkdir -p /config/Jackett/DataProtection

# Copier les indexers personnalisés
echo "Copying custom indexers to config volume..."
cp -f /app/indexer-definitions/*.yml /config/Jackett/Indexers/ 2>/dev/null || true

echo "Custom indexers copied successfully"

# Lancer Jackett
exec dotnet /app/jackett.dll --NoRestart --NoUpdates --DataFolder=/config