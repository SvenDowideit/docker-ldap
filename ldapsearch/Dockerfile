FROM debian:jessie
MAINTAINER Sven Dowideit <SvenDowideit@home.org.au>

RUN apt-get update
RUN apt-get install -yq ldap-utils

ENTRYPOINT ["ldapsearch"]
CMD ["-x", "-h", "10.10.10.21", "-b", "dc=test,dc=com"]

