#!/bin/bash



postconf - e "relayhost = [smtp.gmail.com]:587"
postconf - e "smtp_sasl_auth_enable = yes"
postconf - e "smtp_sasl_security_options = noanonymous"
postconf - e "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd"
postconf - e "smtp_use_tls = yes"
postconf - e "smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt"


echo "[smtp.gmail.com]:587 USERNAME:PASSWORD" > /etc/postfix/sasl_passwd

postmap /etc/postfix/sasl_passwd


chown root:root /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
chmod 0600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db

service postfix restart

echo "This is the email body." | mail -s "Email subject" -a "From: youraddress@gmail.com" to@gmail.com

