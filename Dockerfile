FROM debian:jessie

RUN apt-get update -qq

# use noninteractive so we don't get prompted to enter an admin password.
# see http://ubuntuforums.org/showthread.php?t=2054067
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y slapd ldap-utils -qq

RUN rm -rf /etc/ldap/slapd.d && rm -rf /var/lib/ldap/*
ADD slapd.tar.gz /etc/ldap
ADD db.ldif /tmp/

ADD start_slapd.sh /usr/local/bin/start_slapd
RUN mkdir /var/run/ldap

EXPOSE 389 636

#ENTRYPOINT ["/usr/local/bin/start_slapd", "-h ldapi:/// ldap:/// ldaps:///"]
ENTRYPOINT ["/usr/local/bin/start_slapd"]

CMD []
