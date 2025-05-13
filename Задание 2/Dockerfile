FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
COPY nginx.crt /etc/nginx/ssl/
COPY nginx.key /etc/nginx/ssl/
