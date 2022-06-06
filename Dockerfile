FROM golang:1.18

WORKDIR /usr/src/app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/aws_resource_exporter ./...

CMD ["aws_resource_exporter"]
