# Security

RVM `1.26.0` signs all releases and the `rvm-installer` script. Verification procedure is automatic and it will fail to install new version. We are using following keys from our main maintainers:

    409B6B1796C275462A1703113804BB82D39DC0E3 # mpapis
    7D2BAF1CF37B13E2069D6956105BD0E739499BDB # pkuczynski

It is important first step, before attempting RVM install, to install `gpg2` and import those keys:

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

If it fails you might want to try with `gpg2` and/or `sudo`. 

If you encounter problem with the key server above, you can try a different one. Some alternatives are presented below. It is known issue that if your host does not have IPv6 enabled (often happening in docker containers) some key servers will fail.

* hkp://ipv4.pool.sks-keyservers.net
* hkp://pgp.mit.edu
* hkp://keyserver.pgp.com

GPG version 2.1.17 has a bug which cause failures during fetching keys from remote server. Please downgrade or upgrade to newer version.

Alternatively you might want to import keys directly from our web server:

    curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

Identity of our keys can be also confirmed at https://keybase.io:

* [mpapis](https://keybase.io/mpapis)
* [pkuczynski](https://keybase.io/piotrkuczynski)
