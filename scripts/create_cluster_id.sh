#!/bin/bash

file_path="/tmp/clusterID/clusterID"

# Check if the directory exists, create it if it doesn't
mkdir -p "$(dirname "$file_path")"

# Print directory permissions and ownership for debugging
ls -ld "$(dirname "$file_path")"

# Check if the file exists, create it if it doesn't
if [ ! -f "$file_path" ]; then
  echo "Creating cluster ID file..."
  /bin/kafka-storage random-uuid > "$file_path" || { echo "Failed to create cluster ID file"; exit 1; }
  echo "Cluster ID has been created..."
fi

# Change file permissions to 777
chmod +x "$file_path" || { echo "Failed to change permissions for cluster ID file"; exit 1; }
