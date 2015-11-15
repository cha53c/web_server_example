# Create a Server for a RoR Web Application with Nginx and Passenger using Docker

## Summary
This is an simple example of a web server for a RoR application using [Docker](https://www.docker.com). It uses the [Nginx](https://www.nginx.com) web server with [Phusion Passenger](https://www.phusionpassenger.com) as the web application server.

The web application is the the default rails app created using `rails new`.  The successfully running container will serve the default Rails 'Welcome aboard' page on port 80

This example is build on the [cloudgear/ruby:2.2](https://hub.docker.com/r/cloudgear/ruby) image which provides a mininal Ruby 2.2 installed on Ubuntu 14.04

## Getting Started

You will need Docker installed on your work station. For mac and windows see [Docker Toolbox](https://www.docker.com/docker-toolbox). For Linux find your flavour [here](http://docs.docker.com/v1.8/installation/)

You do not need to have Ruby or Rails installed on your work station

## Build Steps
First clone this repo with the Dockerfile and context to your work station.

`git clone git@github.com:cha53c/web_server_example.git`

This contains everything to build the container and run nginx, but is does not contain the RoR application which will need to be created in the web_server_example directory.  You can either create this wtih Rails or clone ir from Github.

To create from with Rails
`rails new default_web_app`


To clone from repo
`git clone git@github.com:cha53c/default_web_server`

Now you have everything to build the container.  The directory you are in (which should be web_server_example) will be the context for the build and is referenced with the '.'

Build the container with the following command

`docker build -t web_server_example .`

Have a look at your local images type `docker image` in you command line. 


Now that this has built successfully you can run the container. The server will be listening on port 80, if there is anything else listening on that port it won't bind

`docker run -d -p 80:80 web_server_example`

You can now check the image is running with `docker ps`

Now you should be able to hit the web page with 'http://<your_docker_ip>'
If your a running Docker on Mac or Windows the IP with the IP of the Docker host which is show when you start it up. 

## Notes on the Dockerfile
+ Install apt package, node js is needed is need as the javascript engine
+ Install bundler and Rails
+ Install the passenger gem and use this to install Nginx. Note This specifies the Nginx root as /opt/nginx. Copy the config file from the context.
+ Change to tmp dire and copy the Gemfile and Gemfile lock to a tmp directory tree. This is to enable the result of bundle install to be cached
+ Run bundle install
+ Copy in the web app
+ Create the db. Note we are running in development mode.
+ Set the permission on the web app require for Nginx
+ expose port 80
+ State the command to run when the contain is started

## Note on nginx.conf
