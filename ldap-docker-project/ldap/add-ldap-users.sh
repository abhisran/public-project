#!/bin/bash

# Wait until the LDAP server is ready
echo "Waiting for the LDAP server to start..."
sleep 5

# Add user1 to LDAP
ldapadd -x -D "cn=admin,dc=master-ldap,dc=com" -w adminpassword -f /container/service/slapd/assets/config/bootstrap/add_user1.ldif

# Run the original entrypoint for osixia/openldap
exec /container/tool/run
