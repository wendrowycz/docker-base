FROM ubuntu:18.04
MAINTAINER Vikingu
RUN apt-get update; apt-get install -y unzip openjdk-11-jre-headless wget supervisor docker.io openssh-server nginx
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN echo 'root:vikingu' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf && chown -R www-data:www-data /var/lib/nginx

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

WORKDIR /etc/nginx
CMD ["nginx"]

EXPOSE 22
EXPOSE 80
EXPOSE 443