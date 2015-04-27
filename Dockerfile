FROM debian:jessie

RUN apt-get update -qq

# use noninteractive so we don't get prompted to enter an admin password.
# see http://ubuntuforums.org/showthread.php?t=2054067
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y slapd ldap-utils -qq

RUN rm -rf /etc/ldap/slapd.d && rm -rf /var/lib/ldap/*

ADD * /ldap/
RUN mkdir /var/run/ldap

EXPOSE 389 636

ENV LDAP_ROOTPASS admin
ENV LDAP_ORGANISATION test org
ENV LDAP_DOMAIN test.com

ENTRYPOINT ["/ldap/slapd.sh"]

CMD []

WORKDIR /ldap
