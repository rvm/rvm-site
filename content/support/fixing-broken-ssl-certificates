---
title: How to fix broken certificates in your operating system.
---

From time to time people have SSL issues on specific operating systems.  This page
should serve as a guide to fixing your Curl and OpenSSL issues (with Ruby) if you
do not have RVM already installed.  If you do have RVM already installed you can
simply run the RVM command to do this automatically: `<insert that command here>`.

### MacOS X

#### Extracting certificates from Apple’s Keychain

```bash
cert_file="$( openssl version -d | awk -F'"' '{print $2}' )/cert.pem"
mkdir -p "${cert_file%/*}"
security find-certificate -a -p /Library/Keychains/System.keychain > "$cert_file"
security find-certificate -a -p /System/Library/Keychains/SystemRootCertificates.keychain >> "$cert_file"
```
Notes:
Curl “77” Error (E77): Replace `cert_file=”...”` with displayed `CAfile`

### Linux

(Exchange `<package-manager>` for `yum`, `apt-get` or `zypper`)

```bash
<package-manger> install ca-certificates
```
