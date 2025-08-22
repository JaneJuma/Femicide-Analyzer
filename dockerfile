# ---- 1) Build PHP dependencies
FROM composer:2 AS vendor
WORKDIR /app
COPY composer.json composer.lock ./
RUN composer install --no-dev --prefer-dist --no-interaction --no-progress
COPY . .
RUN composer dump-autoload --optimize

# ---- 2) Build front-end (Vite)
FROM node:20-alpine AS assets
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci
COPY . .
RUN npm run build

# ---- 3) Final runtime (Nginx + PHP-FPM + Supervisor)
FROM php:8.3-fpm-alpine

# System deps
RUN apk add --no-cache nginx supervisor bash icu-dev libpng-dev libzip-dev oniguruma-dev \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql intl gd zip

WORKDIR /var/www/html

# Copy app
COPY --from=vendor /app /var/www/html
COPY --from=assets /app/public/build /var/www/html/public/build

# Nginx & Supervisor config
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/site.conf /etc/nginx/http.d/default.conf
COPY docker/supervisord.conf /etc/supervisord.conf
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Permissions (storage/logs)
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
