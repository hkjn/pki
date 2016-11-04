# pki

Repo pki holds a PKI image.

# Usage

## Generate self-signed Certificate Authority's certificate and key

```
docker run -v /etc/pki:/certs hkjn/pki initca
```

# Generate certificate and key for `myclient` signed by the CA

```
docker run -v /etc/pki:/certs hkjn/pki gencert myclient
```
