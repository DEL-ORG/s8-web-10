FROM ubuntu:latest
RUN apt update
RUN apt install apache2 -y

# RUN cd /var/www/html
WORKDIR /var/www/html
RUN rm -rf *
COPY ./application-01 .

# Expose port 80 to allow external access to the web server
EXPOSE 80

# Start apache when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]
