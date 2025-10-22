#!/bin/bash
# Pre-Build Script
# Ejecutado antes de construir la imagen Docker
# Verifica que los archivos estén en orden y limpia caches si es necesario

echo "🔹 Pre-Build: Comprobando estructura de archivos..."
if [ ! -d "./application/src/web" ]; then
    echo "❌ Error: No se encontró la carpeta ./application/src/web"
    exit 1
fi

echo "🔹 Limpiando archivos temporales..."
find ./application/src/web -name '*.tmp' -type f -delete

echo "🔹 Pre-Build listo ✅"
