---
title: Installing rubies behind a proxy.
---

# Installing RVM behind a proxy

## Export your shell environment for http proxy use

export http_proxy=`"http://hostname:port"` or save it to your shell profile. (i.e. ~/.bash_rc)

```
export http_proxy="http://example.proxy_name.com:80"
```

For multi-user installs, use sudo -E to preserve the proxy settings in your environment:

```
curl -sSL https://get.rvm.io | sudo -E bash -s stable
```

## Setting git to use a proxy

Set your git tool to use the environment proxy inside you ~/.gitconfig

```
[http]
  proxy = %http_proxy%
```

# Using RVM behind a proxy

There are a few ways to use RVM from behind a proxy.

## --proxy

You can pass the proxy sever to use directly to RVM:

```
rvm install X --proxy $domain_or_ip:$port
```

## Using CURL

Set the proxy inside your ~/.curlrc:

```
proxy = example.proxy_name.com:80
```

# Community Resources
