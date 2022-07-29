FROM golang:1.17.8-bullseye

WORKDIR /factory

# set up tools
RUN apt-get update && apt-get upgrade -y && apt-get install unzip

# install nodejs
RUN apt-get install nodejs -y

# install npm
RUN apt-get install npm -y

# insatll prettier
RUN npm install -g prettier

# set up micro/micro
RUN git clone https://github.com/micro/micro.git

# set up micro/services
RUN git clone https://github.com/micro/services.git

# install protoc v3.20.0
RUN curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v3.20.0/protoc-3.20.0-linux-x86_64.zip
RUN unzip protoc-3.20.0-linux-x86_64.zip
RUN mv bin/protoc /go/bin
RUN mv include /go/bin

# install protoc gen micro plugin
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN go get github.com/micro/micro/v3/cmd/protoc-gen-micro@master

# Install openapi plugin
RUN go install m3o.dev/cmd/protoc-gen-openapi@main

# install generators old/new
RUN go install github.com/m3o/m3o-client-gen@main

# set working directory to factory/services
WORKDIR /factory/services

COPY entrypoint.sh /entrypoint.sh

# change permission to execute entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
