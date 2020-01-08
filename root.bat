openssl genpkey -algorithm RSA -out root.key -pkeyopt rsa_keygen_bits:4096 -pkeyopt rsa_keygen_pubexp:3
openssl req -verify -new -out root.csr -key root.key -config root.conf
openssl req -text -noout -in root.csr
openssl x509 -req -days 3650 -in root.csr -signkey root.key -out root.crt -extfile root.conf -extensions v3_req 