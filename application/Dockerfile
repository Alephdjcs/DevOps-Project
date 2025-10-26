# ------------------------------------------------------------------------------
# Dockerfile – Local Version (for pre-Jenkins testing only)
# ------------------------------------------------------------------------------
# ⚠️ IMPORTANT NOTE:
# This Dockerfile was used exclusively for initial local testing
# before automating the build and continuous integration process with Jenkins.
# It is not used in the current production pipeline.
# It is kept here as a technical reference and an example of best practices.
# ------------------------------------------------------------------------------

# Minimal NGINX base image (fixed version for stability)
FROM nginx:1.27.0-alpine

# Copy static website files into NGINX’s HTML directory
COPY src/web /usr/share/nginx/html

# Set up a non-root user for better security
RUN adduser -D -g '' appuser \
    && chown -R appuser:appuser /usr/share/nginx/html
USER appuser

# Expose port 80 (served by NGINX)
EXPOSE 80

# Optional health check for local environments
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s \
  CMD wget -qO- http://localhost:80 > /dev/null || exit 1

# Startup command: run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
