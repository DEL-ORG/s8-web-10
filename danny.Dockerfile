FROM httpd
LABEL maintainer="ektech"
ARG port=80
USER root
RUN apt -y update 
WORKDIR /usr/local/apache2/htdocs/

RUN rm -rf *
ADD ./code/* /usr/local/apache2/htdocs/

ENTRYPOINT ["httpd-foreground"]
EXPOSE ${port}
