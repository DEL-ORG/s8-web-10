# Use Ubuntu base image
FROM ubuntu:latest

# Update package lists and install Apache
RUN apt-get update && apt-get install -y apache2

# Set the working directory inside the container
WORKDIR /var/www/html/

# Copy the HTML files from the application-01 directory into the working directory
COPY . .
# Expose port 80 to the outside world
EXPOSE 80

# Start Apache when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]
