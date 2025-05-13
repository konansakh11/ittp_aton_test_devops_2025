FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
COPY source/default.conf /etc/nginx/conf.d/
COPY source/index.html /usr/share/nginx/html/
COPY source/nginx.crt /etc/nginx/ssl/
COPY source/nginx.key /etc/nginx/ssl/
