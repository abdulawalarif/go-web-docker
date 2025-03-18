# # We specify the base image we need for our GO app
FROM golang:1.18.1-buster

# # Create /app directory within the image to hold our applicaiton source code
WORKDIR /app

# # We copy everything in the root directory inot our /app directory
COPY . .

## install dependencies
RUN go mod download

## build the app with optional configuration

RUN go build -o /godocker

# # tells Docker that the container listens on specified network ports at runtime
EXPOSE 8080
# # commands to be used to execute when the image is used to start a container
CMD [ "/godocker" ]