


run: build
	docker run -it --rm -p 389:389 -p 636:636 --name ldap-test docker-ldap

debug:
	docker run --entrypoint bash --rm -it -p 389:389 -p 636:636 --name ldap-test docker-ldap

exec:
	docekr exec -it ldap-test bash

build:
	docker build -t docker-ldap .
