FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/ \
     index.html /usr/share/nginx/html/ \
     nginx.crt nginx.key /etc/nginx/ssl/
