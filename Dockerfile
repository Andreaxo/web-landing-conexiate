FROM nginx:alpine

# Limpiar archivos por defecto de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copiar todos los archivos de la web informativa al directorio de Nginx
COPY . /usr/share/nginx/html

# Copiar la configuración de Nginx con soporte para URLs limpias y gzip
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Eliminar archivos de configuración del directorio público
RUN rm -f /usr/share/nginx/html/nginx.conf /usr/share/nginx/html/Dockerfile /usr/share/nginx/html/.gitignore

# Exponer puerto estándar HTTP
EXPOSE 80

# Iniciar servidor Nginx
CMD ["nginx", "-g", "daemon off;"]
