#!/bin/sh

set -e


# simplistic initial configuration inspired from
# https://www.lisenet.com/2014/install-and-configure-an-openldap-server-with-ssl-on-debian-wheezy/

# The following 2 commands are replaced by using slapadd in slapd.sh
#ldapadd -x -D cn=admin,dc=test,dc=com -w admin -f ./guest.ldif
#ldappasswd -x -D cn=admin,dc=test,dc=com -w admin -s guest cn=guest,dc=test,dc=com

ldapadd -x -D cn=admin,dc=test,dc=com -w admin -f ./org.ldif
ldapadd -x -D cn=admin,dc=test,dc=com -w admin -f ./user.ldif
ldappasswd -x -D cn=admin,dc=test,dc=com -w admin -s alc uid=alc,ou=Users,dc=test,dc=com
