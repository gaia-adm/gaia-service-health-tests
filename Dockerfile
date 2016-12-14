FROM golang:1.7.4-alpine

MAINTAINER Shay Tsadok <shayts7@gmail.com>

# install curl apk
RUN apk add --update curl

# install Git apk
RUN apk --update add git bash \
    && rm -rf /var/lib/apt/lists/* \
    && rm /var/cache/apk/*

ADD . /go/src/github.com/gaia-adm/gaia-service-health-tests
WORKDIR /go/src/github.com/gaia-adm/gaia-service-health-tests
RUN go get -v github.com/sectioneight/go-junit-report

LABEL tugbot.test=true
LABEL tugbot.results.dir=/go/src/github.com/gaia-adm/gaia-service-health-tests/junitreports
LABEL tugbot.event.docker=
LABEL tugbot.event.docker.filter.type=container
LABEL tugbot.event.docker.filter.action=start

CMD mkdir -p junitreports &&  go test -v . | go-junit-report > junitreports/report.xml
