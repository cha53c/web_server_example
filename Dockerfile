FROM cloudgear/ruby:2.2

MAINTAINER cha53c

RUN apt-get update 
RUN apt-get install -y curl nodejs

RUN gem install bundler rails
RUN gem install passenger -v '=5.0.6'

RUN passenger-install-nginx-module --auto-download --auto --prefix=/opt/nginx --languages ruby

WORKDIR /tmp
ADD my_web_app/Gemfile Gemfile
ADD my_web_app/Gemfile.lock Gemfile.lock
RUN bundle install

COPY nginx.conf /opt/nginx/conf/

COPY my_web_app /var/www/my_web_app
RUN touch /var/www/my_web_app/db/development.sqlite3

RUN chmod -R 755 /var/www/

EXPOSE 80

CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]]
