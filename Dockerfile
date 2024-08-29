# Use the latest Ubuntu image as the base image
FROM ubuntu:latest

# Update the package repository and install Apache (HTTPD)
RUN apt update && apt install apache2 -y

# Set the working directory to Apache's document root
WORKDIR /var/www/html

# Copy the application files from the host to the container's document root
COPY ./application-02/* /var/www/html/

# Expose port 80 to allow traffic to the Apache server
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]




