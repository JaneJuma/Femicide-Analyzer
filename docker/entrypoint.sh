#!/usr/bin/env bash
set -e

cd /var/www/html

# Make sure app key exists (safe to run multiple times)
php artisan key:generate --force || true

# Cache config/routes/views for speed
php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true

# Storage symlink (safe if already linked)
php artisan storage:link || true

# Run migrations (skip errors if DB not ready yet)
php artisan migrate --force || true

exec /usr/bin/supervisord -c /etc/supervisord.conf
