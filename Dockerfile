# Build the website html
FROM klakegg/hugo:0.101.0-alpine AS build

RUN apk add --no-cache git

COPY . /site

WORKDIR /site

RUN rm -rvf docker

RUN hugo --minify 
# --enableGitInfo

# Build the final image
FROM nginx:1.23.3

WORKDIR /usr/share/nginx/html

RUN rm -fr * .??*

RUN sed -i '9i\        include /etc/nginx/conf.d/expires.inc;\n' /etc/nginx/conf.d/default.conf

COPY docker/expires.inc /etc/nginx/conf.d/expires.inc

RUN chmod 0644 /etc/nginx/conf.d/expires.inc

COPY --from=build /site/public /usr/share/nginx/html
