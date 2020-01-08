openssl genpkey -algorithm RSA -out server.key -pkeyopt rsa_keygen_bits:4096 -pkeyopt rsa_keygen_pubexp:3
openssl req -new -key server.key -config server.conf -out server.csr 
openssl x509 -req -days 3650 -CA root.crt -CAkey root.key -CAcreateserial -extfile server.conf -extensions v3_req -in server.csr -out server.crt 
openssl pkcs12 -export -in server.crt -inkey server.key -out server.pfx