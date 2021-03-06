FROM cloudgear/ruby:2.2

MAINTAINER cha53c

RUN apt-get update 
RUN apt-get install -y curl nodejs && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* 


RUN gem install bundler rails

# Install nginx using the passenger gem. This will download and compile nginx with passenger
# as a module
RUN gem install passenger -v '=5.0.6'
RUN passenger-install-nginx-module --auto-download --auto --prefix=/opt/nginx --languages ruby

# copy the nginx.conf from the context
COPY nginx.conf /opt/nginx/conf/

# put the gemfiles in their on dir hierarchy to allow the cashed bundle install to be used
WORKDIR /tmp
COPY default_web_app/Gemfile Gemfile
COPY default_web_app/Gemfile.lock Gemfile.lock
RUN bundle install && rm -rf /tmp/*

# copy the rails app from the context
COPY default_web_app /var/www/default_web_app

# Create the db file to use default config
RUN touch /var/www/default_web_app/db/development.sqlite3

# set permissions needed for nginx
RUN chmod -R 755 /var/www/

# Expose the port nginx runs on
EXPOSE 80

#Start nginx when the container is run
CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]]
