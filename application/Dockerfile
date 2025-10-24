# ------------------------------------------------------------------------------
# Dockerfile - Versión local (solo para pruebas previas a Jenkins)
# ------------------------------------------------------------------------------
# ⚠️ NOTA IMPORTANTE:
# Este Dockerfile fue utilizado únicamente para pruebas locales iniciales
# antes de automatizar el proceso de build e integración continua con Jenkins.
# No se usa en el pipeline de producción actual.
# Se mantiene aquí como referencia técnica y ejemplo de buenas prácticas.
# ------------------------------------------------------------------------------

# Imagen base mínima de NGINX (versión fija para estabilidad)
FROM nginx:1.27.0-alpine

# Copiamos los archivos del sitio estático al directorio HTML de NGINX
COPY src/web /usr/share/nginx/html

# Establecemos un usuario no root por seguridad
RUN adduser -D -g '' appuser \
    && chown -R appuser:appuser /usr/share/nginx/html
USER appuser

# Exponemos el puerto 80 (servido por NGINX)
EXPOSE 80

# Comprobación de salud (opcional para entornos locales)
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s \
  CMD wget -qO- http://localhost:80 > /dev/null || exit 1

# Comando de inicio: ejecutar NGINX en primer plano
CMD ["nginx", "-g", "daemon off;"]

