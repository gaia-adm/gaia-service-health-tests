# gaia-service-health-tests

This golang repo contains go test that does simple http validation to Gaia services (HTTP GET on a particular url and checks the HTTP Response)
The output is then converted to Junit report.
The test is integrated with tugbot and runs on production