FROM php:8.2-fpm

# تثبيت الاعتماديات وامتدادات PHP المطلوبة
RUN apt-get update && apt-get install -y \
    git curl libpng-dev libonig-dev libxml2-dev zip unzip

# تنظيف الكاش
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# تثبيت امتدادات قاعدة البيانات والتشفير
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# جلب مفسر Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
