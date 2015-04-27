


run: build clean
	docker run -it --rm -p 389:389 -p 636:636 --name ldap-test docker-ldap

debug: clean
	docker run --entrypoint bash --rm -it -p 389:389 -p 636:636 --name ldap-test docker-ldap

clean:
	docker rm -f ldap-test || true

exec:
	docker exec -it ldap-test bash

build:
	docker build -t docker-ldap .
