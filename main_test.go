package main

import (
	"net/http"
	"testing"
)

//const urlToCheck = "http://google.com"

func TestServices(t *testing.T) {

	servicesToCheck := []struct {
		url  string
		expectedHttpCode  int
	}{
		//{"http://es.skydns.local:9200/_search", 200},
		{"http://google.com", 200},
		{"http://facebook.com", 200},
	}
	for _, serviceToCheck := range servicesToCheck {
		t.Run(serviceToCheck.url, func(t *testing.T) {
			resp, err := http.Get(serviceToCheck.url)
			defer resp.Body.Close()
			if err != nil {
				panic(err)
			}

			if resp.StatusCode != serviceToCheck.expectedHttpCode {
				t.Errorf("service %s, returned http status code %d, instead of %d", serviceToCheck.url, resp.StatusCode, serviceToCheck.expectedHttpCode)
			}

		})
	}
}
