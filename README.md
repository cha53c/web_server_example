# Create a Server for a RoR Web Application with Nginx and Passenger using Docker

## Summary
This is a simple example of how to create a web server for a RoR application using Docker. It uses nginx is used for web server
passenger is the web application server using a fully integrated verions of passenger.  
We will run a default rails app which you and either clone for blah.blah.blah or create yourself using the `rails new my_web_app`

## Getting Started
You will need to make sure you have a Docker environment running on your machine, see, OSX, Windows and Linux

The first step is to clone this repo to your local machine.

`git clone git@github.com:cha53c/web_server_example.git`

This contains everything you need to build the container and run nginx, but is does not contain the RoR application. You will need to get this once you have cloned this repo. Once you have cloned the repo cd into it and clone blah.blah.blah web application the name of the repo will give you the correct directory

Now you have everything to build the container.  The directory you are in, (which should be web_server_example) will be the context for the build and referenced with the '.'

`docker build cha53c/web_server_example .`

Have a look at you local images type `docker image` in you command line. You should see ...


Now that this has built successfully you can run the container
`docker run -d -p 80:80 cha53c/web_server_example`

Check the image is running with `docker ps`. this will show you all the containers you have running. In this case it should just be one.

## Notes on the Dockerfile

