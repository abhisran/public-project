FROM osixia/openldap:1.5.0

# Copy the LDIF file to the correct location for initialization
COPY bootstrap.ldif /container/service/slapd/assets/config/bootstrap.ldif

RUN echo -e "dn: uid=user1,dc=master-ldap,dc=com\nobjectClass: inetOrgPerson\nobjectClass: posixAccount\nobjectClass: top\ncn: User1\nsn: 1\nuid: user1\nuidNumber: 1001\ngidNumber: 1001\nhomeDirectory: /home/user1\nuserPassword: {SSHA}LyU4qnVQeS08mfnSOM24CMZE45MDCw1F" > add_user1.ldif

RUN ldapadd -x -D "cn=admin,dc=master-ldap,dc=com" -w adminpassword -f add_user1.ldif