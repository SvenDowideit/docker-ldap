# slapd

A basic configuration of the OpenLDAP server, slapd, with support for data
volumes.

This image will initialize a basic configuration of slapd. Most common schemas
are preloaded (all the schemas that come preloaded with the default Ubuntu
Precise install of slapd), but the only record added to the directory will be
the root organisational unit.

You can (and should) configure the following by providing environment variables
to `docker run`:

- `LDAP_DOMAIN` sets the LDAP root domain. (e.g. if you provide `foo.bar.com`
  here, the root of your directory will be `dc=foo,dc=bar,dc=com`)
- `LDAP_ORGANISATION` sets the human-readable name for your organisation (e.g.
  `Acme Widgets Inc.`)
- `LDAP_ROOTPASS` sets the LDAP admin user password (i.e. the password for
  `cn=admin,dc=example,dc=com` if your domain was `example.com`)


## Start a default `test.com` LDAP server container

Run `make run` - this will build your image, and then start the `ldap-test` container.

By default, the `cn=admin,dc=test,dc=com` user's password is set to `admin`.

> **Note**: by default, this container is set up to make to the LDAP ports
> on your Docker daemon host server, so your LDAP server will be accessible
> by all users on your network.

You can find out which port the LDAP server is bound to on the host by running
`docker ps` (or `docker port <container_id> 389`). You could then load an LDIF
file (to set up your directory) like so:

    ldapadd -h localhost -p <host_port> -c -x -D cn=admin,dc=mycorp,dc=com -W -f data.ldif


## Testing access

Run `make exec` to get a Bash shell inside the `ldap-test` container, or `make client`
to create a new container linked to the `ldap-test` `slapd`.

Inside the client container, you can search the LDAP database using:

```
ldapsearch -h sldapd -D cn=admin,dc=test,dc=com -W -b dc=test,dc=com
```

## Configure default user database

Run `docker exec -it ldap-test /ldap/import.sh` to add a `guest` and `alc`
user, then

`docker exec -it ldap-test ldapsearch -D uid=alc,ou=Users,dc=test,dc=com -w alc -b dc=test,dc=com`

and

`docker exec -it ldap-test ldapsearch -D cn=guest,dc=test,dc=com -w guest -b dc=test,dc=com`

should work

