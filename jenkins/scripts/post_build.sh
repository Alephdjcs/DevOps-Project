#!/bin/bash
# Post-Build Script
# This script is executed after the Docker image has been built and pushed.
# It performs cleanup tasks, logs the build details, and helps maintain a clean build environment.

# Step 1: Clean up intermediate Docker images to free disk space.
# The '-f' flag forces removal without asking for confirmation.
echo "Post-Build: Cleaning up intermediate images..."
docker image prune -f

# Step 2: Create a directory to store build logs if it does not already exist.
# The '-p' flag ensures that the command does not fail if the directory already exists.
echo "Post-Build: Saving build log..."
mkdir -p jenkins/build_logs

# Step 3: Append a line to the build log file containing the Jenkins build tag and timestamp.
# The environment variable '${BUILD_TAG}' is automatically set by Jenkins.
echo "Build ${BUILD_TAG} completed on $(date)" >> jenkins/build_logs/build.log

# Step 4: Confirm that the post-build process has completed successfully.
echo "Post-Build completed successfully."
