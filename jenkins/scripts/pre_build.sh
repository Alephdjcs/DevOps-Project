#!/bin/bash
# Pre-Build Script
# This script is executed before building the Docker image.
# It checks that required files exist and cleans temporary files if necessary.

# Step 1: Verify that the expected directory structure exists.
# If the critical directory './application/src/web' is missing, exit the build with an error.
echo "Pre-Build: Checking file structure..."
if [ ! -d "./application/src/web" ]; then
    echo "Error: Required directory './application/src/web' not found."
    exit 1
fi

# Step 2: Clean up temporary files to avoid including unnecessary files in the Docker image.
# Deletes all files with the '.tmp' extension under './application/src/web'.
echo "Pre-Build: Cleaning temporary files..."
find ./application/src/web -name '*.tmp' -type f -delete

# Step 3: Indicate that the pre-build steps completed successfully.
echo "Pre-Build completed successfully."
