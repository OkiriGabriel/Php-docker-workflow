# Base image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the application code to the container
COPY src/ /var/www/html

# Install dependencies and enable necessary modules
RUN apt-get update \
    && apt-get install -y \
        libpq-dev \
        libzip-dev \
    && docker-php-ext-install \
        pdo_mysql \
        zip \
    && a2enmod rewrite

# Set up PHP configuration
COPY php.ini /usr/local/etc/php/

# Expose the port on which Apache is listening
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]