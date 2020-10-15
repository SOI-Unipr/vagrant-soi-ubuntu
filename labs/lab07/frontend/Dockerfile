
# starting image: Apache 2.4
# NOTE: Apache image already defines a "command", that is a process (the web server)
#       which starts as soon as the container is started
FROM httpd:2.4-alpine

# HTTP port (80 is default port for http, 443 for https)
EXPOSE 80

# set working directory for Docker commands
WORKDIR /usr/local/apache2

# copy Apache configuration
# NOTE: added inclusion of all .conf files in sites-enabled
COPY httpd.conf /usr/local/apache2/conf

# set up sites available/enabled
RUN mkdir conf/sites-available && mkdir conf/sites-enabled

# copy App configuration into available sites
COPY app.conf /usr/local/apache2/conf/sites-available

# create directory for app content
RUN mkdir -p /var/www/app

# copy application content (HTML/CSS/JS/static assets...) into its site
COPY todo-app-master.zip /var/www/app

# extract app content
RUN cd /var/www/app && unzip todo-app-master.zip && mv todo-app-master/* . && mv -n todo-app-master/.* . && rm todo-app-master.zip

# add "app" to enabled sites through a symbolic link to app.conf in sites-available
RUN ln -s /usr/local/apache2/conf/sites-available/app.conf conf/sites-enabled/app.conf
