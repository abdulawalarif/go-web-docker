# # # We specify the base image we need for our GO app
# FROM golang:1.18.1-buster

# # # Create /app directory within the image to hold our applicaiton source code
# WORKDIR /app

# # # We copy everything in the root directory inot our /app directory
# COPY go.mod .

# ## install dependencies
# RUN go mod download

# # # copy source file in app directory

# COPY main.go .

# ## build the app with optional configuration

# RUN go build -o /godocker

# # # tells Docker that the container listens on specified network ports at runtime
# EXPOSE 8081
# # # commands to be used to execute when the image is used to start a container
# CMD [ "/godocker" ]


FROM golang:1.18.1-buster AS builder
WORKDIR /app
COPY go.mod .
RUN go mod download
COPY *.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o /opt/go-docker-multistage

# final stage
FROM alpine:latest
COPY --from=builder /opt/go-docker-multistage /opt/go-docker-multistage
EXPOSE 8080
ENTRYPOINT [ "/opt/go-docker-multistage" ]