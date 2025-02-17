FROM nginx:1.27

ENV NODE_ENV production

# remove existing files from nginx directory
RUN rm -rf /usr/share/nginx/html/*

# Copy in build
COPY .next /usr/share/nginx/html

# Copy in default.conf
RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# start nginx
CMD ["nginx", "-g", "daemon off;"]
