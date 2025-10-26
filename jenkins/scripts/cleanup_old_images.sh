#!/bin/bash
# Cleanup Old Docker Images Script
# This script deletes older image tags from Docker Hub,
# keeping only the latest 5 numeric tags.

set -e

REPO="dcerdassan/devopssnapfinance"
KEEP=5

echo "Cleaning up old Docker image tags for repository: $REPO"
echo "Keeping the latest $KEEP numeric tags."

# Validate required environment variables
if [ -z "$DOCKER_USER" ] || [ -z "$DOCKER_PASS" ]; then
  echo "ERROR: Docker credentials not found in environment variables (DOCKER_USER / DOCKER_PASS)."
  exit 1
fi

# Get all tags from Docker Hub (paginated)
TAGS_JSON=$(curl -s -u "$DOCKER_USER:$DOCKER_PASS" \
  "https://hub.docker.com/v2/repositories/${REPO}/tags/?page_size=100")

# Extract tag names and keep only numeric ones
TAGS=$(echo "$TAGS_JSON" | jq -r '.results[].name' | grep -E '^[0-9]+$' | sort -nr)

if [ -z "$TAGS" ]; then
  echo "No numeric tags found to clean up."
  exit 0
fi

echo "Found tags:"
echo "$TAGS"

# Determine which to delete (all except the newest $KEEP)
DELETE_TAGS=$(echo "$TAGS" | tail -n +$((KEEP + 1)))

if [ -z "$DELETE_TAGS" ]; then
  echo "No old tags to delete. Only $KEEP or fewer exist."
  exit 0
fi

echo "Deleting old tags:"
echo "$DELETE_TAGS"

# Loop and delete each old tag
while read -r TAG; do
  echo "Deleting tag: $TAG ..."
  curl -s -u "$DOCKER_USER:$DOCKER_PASS" -X DELETE \
    "https://hub.docker.com/v2/repositories/${REPO}/tags/${TAG}/" \
    && echo "Deleted: $TAG" || echo "Failed to delete: $TAG"
done <<< "$DELETE_TAGS"

echo "Cleanup completed successfully. Kept the latest $KEEP tags."
