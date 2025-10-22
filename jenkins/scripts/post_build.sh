#!/bin/bash
# Post-Build Script
# Ejecutado después de construir y subir la imagen Docker
# Puede generar reportes, limpiar, o notificar

echo "🔹 Post-Build: Limpiando imágenes intermedias..."
docker image prune -f

echo "🔹 Post-Build: Guardando log del build..."
mkdir -p jenkins/build_logs
echo "Build ${BUILD_TAG} completado en $(date)" >> jenkins/build_logs/build.log

echo "🔹 Post-Build listo ✅"
