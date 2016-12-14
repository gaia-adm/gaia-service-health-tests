FROM golang:1.7.3-onbuild

# running golang linter to find problems that the compliter did not find
RUN go vet ./...

RUN go get -v github.com/sectioneight/go-junit-report

# running any test that exist in the project
RUN go test -v ./... | go-junit-report

LABEL tugbot.test=true
LABEL tugbot.results.dir=/src/results/junitreports
LABEL tugbot.event.docker=
LABEL tugbot.event.docker.filter.type=container
LABEL tugbot.event.docker.filter.action=start