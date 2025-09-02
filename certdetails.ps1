#Create Key
openssl genrsa -out example.domain.co.uk 2048

#Create Key Pair using config file.
openssl req -new -key example.domain.co.uk -out example.domain.co.uk.csr -config san.cnf

#If you need the key password protected.
openssl rsa -aes256 -in example.domain.co.uk.key -out example.domain.co.uk.enc.key

#Check the issuer of a cert.
openssl x509 -in example.domain.crt -noout -subject -issuer

#Creating PFX (this is for the Service Certificate)
openssl pkcs12 -export -out example.domain.co.uk.pfx `
  -inkey example.domain.co.uk.enc.key `
  -in example.domain.co.uk.crt `
  -certfile example.domain.co.uk.ca-bundle.crt

#Use this PEM to break up the bundle. (open using notepad and create the keys up)
openssl crl2pkcs7 -nocrl -certfile example.domain.co.uk.ca-bundle | openssl pkcs7 -print_certs -out all-certs.pem

/#
Server certificate (example.domain.co.uk)

Intermediates (DV R36, R46)

Root (USERTrust)

#/
