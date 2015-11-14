# Create a Server for a RoR Web Application with Nginx and Passenger using Docker

## Summary
This is a simple example of how to create a web server for a RoR application using Docker. It uses nginx for web server
passenger as the web application server using a fully integrated verions of passenger.  
We will run a default rails app created using `rails new my_web_app`.

The successfully running container will serve the default Rails 'Welcome aboard' page on port 80

## Getting Started
If you do not already have Docker installed on your machine you will need to do so. For mac and windows see [Docker Toolbox](https://www.docker.com/docker-toolbox). For Linux find your flavour [here](http://docs.docker.com/v1.8/installation/)

You do not need to have Ruby or Rails installed on your work station

## Build Steps
The first step is to clone this repo with the Dockerfile and context to your work station.

`git clone git@github.com:cha53c/web_server_example.git`

This contains everything you need to build the container and run nginx, but is does not contain the RoR application.
This needs to be created in the web_server_example directory.  You can either create this Rails or clone from Github.

To create from with Rails
`rails new default_web_app`


To clone from repo
`git clone git@github.com:cha53c/default_web_server`

Now you have everything to build the container.  The directory you are in (which should be web_server_example) will be the context for the build and is referenced with the '.'

Build the container with the following command

`docker build -t web_server_example .`

Have a look at your local images type `docker image` in you command line. You should see your image in the list something like this.


REPOSITORY          TAG       IMAGE ID     CREATED            VIRTUAL SIZE
web_server_example  latest   4fdadc688ca6  25 hours ago     585.2 MB


Now that this has built successfully you can run the container. The server will be listening on port 80
`docker run -d -p 80:80 web_server_example`

You can now check the image is running with `docker ps`. This will show you all the containers you have running. In this case it should just be one which should look something like this

`CONTAINER ID        IMAGE                       COMMAND                  CREATED             STATUS              PORTS                NAMES
914b555fb0ab        cha53c/web_server_example   "/opt/nginx/sbin/ngin"   25 hours ago        Up 25 hours         0.0.0.0:80->80/tcp   sharp_brahmagupta`


## Notes on the Dockerfile
## Note on nginx.conf
