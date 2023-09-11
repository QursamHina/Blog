<<<<<<< HEAD
# Use an official PHP runtime as a parent image
FROM php:8.1-fpm

# Set the working directory to /var/www
WORKDIR /var/www

# Install PHP extensions and other dependencies
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    && docker-php-ext-install pdo pdo_mysql

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy composer.json and composer.lock
COPY composer.json composer.lock ./

# Install application dependencies
RUN composer install --no-scripts --no-autoloader

# Copy the rest of the application code
COPY . .

# Generate the autoloader
RUN composer dump-autoload

# Expose port 9000 and start PHP-FPM server
EXPOSE 9000
CMD ["php-fpm"]
=======
# Use an official PHP runtime as a parent image
FROM php:8.1-fpm

# Set the working directory to /var/www
WORKDIR /var/www

# Install PHP extensions and other dependencies
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    && docker-php-ext-install pdo pdo_mysql

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy composer.json and composer.lock
COPY composer.json composer.lock ./

# Install application dependencies
RUN composer install --no-scripts --no-autoloader

# Copy the rest of the application code
COPY . .

# Generate the autoloader
RUN composer dump-autoload

# Expose port 9000 and start PHP-FPM server
EXPOSE 9000
CMD ["php-fpm"]
>>>>>>> 2877210722c1c7af8a8aaac754c8846a3593856a
