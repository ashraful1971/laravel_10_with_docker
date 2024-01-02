# 1. Specify the base image
FROM php:latest

# 2. Install required system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# 3. Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# 4. Set working directory
WORKDIR /var/www/html

# 5. Copy application code
COPY . /var/www/html/

# 6. Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 7. Install Composer dependencies
RUN composer install

# 8. Generate fresh env file
RUN cp .env.example .env

# 9. Generate fresh key
RUN php artisan key:generate

# 10. Expose port (optional, for web server)
EXPOSE 8000

# 11. Define the command to run when starting the container
CMD [ "php", "artisan", "serve", "--host=0.0.0.0", "--port=8000" ]