# Create a Server for a RoR Web Application with Nginx and Passenger

## Summary
This is a simple example of how to create a web server for a RoR application using Docker. It uses nginx is used for web server
passenger is the web application server using a fully integrated verions of passenger.  
We will run a default rails app which you and either clone for blah.blah.blah or create yourself using the `rails new my_web_app'

## Getting Started
The first step is to clone this repo to your local machine.
This contains everything you need to build the container and run nginx, but is does not contain the RoR application. You will need to get this once you have cloned this repo
Once you have cloned the repo
CD into it and clone blah.blah.blah web application the name of the repo will give you the correct directory

Now you have everything to build the container
The directory you are in, (which should be web_server_example) will be the context for the build and referenced with the .

`docker build cha53c/web_server_example.`

