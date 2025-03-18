# Dockerized GO app
<br />
 

 ## Commands for building images

 1. To Build image 
 `docker build --rm -t go-docker:alpha .`

    1.1. For reducing size of the image with  working docker instruction
  `docker build --rm -t go-docker-multistage:beta .`

2. Listing the images in the machine ` docker image ls`

3. Runnin an image `docker run -d -p 8080:8081 --name go-docker-app go-docker:alpha`