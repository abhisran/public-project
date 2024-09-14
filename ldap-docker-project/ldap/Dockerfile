FROM osixia/openldap:1.5.0

# Copy the LDIF file for initialization
COPY bootstrap.ldif /container/service/slapd/assets/config/bootstrap.ldif

# Create LDIF for user addition
RUN echo -e "dn: uid=user1,dc=master-ldap,dc=com\nobjectClass: inetOrgPerson\nobjectClass: posixAccount\nobjectClass: top\ncn: User1\nsn: 1\nuid: user1\nuidNumber: 1001\ngidNumber: 1001\nhomeDirectory: /home/user1\nuserPassword: {SSHA}LyU4qnVQeS08mfnSOM24CMZE45MDCw1F" > /container/service/slapd/assets/config/bootstrap/add_user1.ldif

# Copy the startup script into the container
COPY add-ldap-users.sh /container/service/slapd/assets/config/bootstrap/add-ldap-users.sh

# Make the script executable
RUN chmod +x /container/service/slapd/assets/config/bootstrap/add-ldap-users.sh

# Use the new startup script to initialize users after the LDAP server starts
CMD ["/container/service/slapd/assets/config/bootstrap/add-ldap-users.sh"]
