# Security

At RVM we treat security very serious and cryptographically sign (since version `1.26.0`) all releases and the `rvm-installer` script to ensure it comes from a genuine source.

## GPG

We use GPG for signing. Both `gpg` and `gpg2` should be fine. 

Sometimes `gpg` has problems downloading keys from remote server, it might be better to work with `gpg2` if it's available for your system. However it has been reported that `gpg2` in version 2.1.17 is also affected by such issue. We recommend you to downgrade or upgrade it to a newer version.

## Install our keys

Make sure to only trust the keys of people you trust - if you trust to 
run our code - trust our keys. Here are the keys from our maintainers:

    409B6B1796C275462A1703113804BB82D39DC0E3 # mpapis
    7D2BAF1CF37B13E2069D6956105BD0E739499BDB # pkuczynski

As a first step, before attempting RVM install, you should install `gpg2` and import those keys:

    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

If you encounter problem with the key server above, try a different one. Some alternatives are presented below. It is known issue that if your host does not have IPv6 enabled (often happening in docker containers) some key servers might fail to connect.

* hkp://ipv4.pool.sks-keyservers.net
* hkp://pgp.mit.edu
* hkp://keyserver.pgp.com

Alternatively you might want to import keys directly from our web server, although this is less secure way:

    curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

Identity of our keys can be also confirmed at https://keybase.io:

* [mpapis](https://keybase.io/mpapis)
* [pkuczynski](https://keybase.io/piotrkuczynski)

## Trust our keys

    echo 409B6B1796C275462A1703113804BB82D39DC0E3:6: | gpg2 --import-ownertrust # mpapis@gmail.com
    echo 7D2BAF1CF37B13E2069D6956105BD0E739499BDB:6: | gpg2 --import-ownertrust # piotr.kuczynski@gmail.com

## Run verified installation

We usually recommend everywhere to run installation using following command:

    \curl -sSL https://get.rvm.io | bash -s stable

This should be pretty secure, but in case you want to ensure the installer comes from a valid source, you can run manually verified installation:

    \curl -sSL https://raw.githubusercontent.com/rvm/rvm/stable/binscripts/rvm-installer     -o rvm-installer &&
    \curl -sSL https://raw.githubusercontent.com/rvm/rvm/stable/binscripts/rvm-installer.asc -o rvm-installer.asc &&
    \gpg2 --verify rvm-installer.asc rvm-installer &&
    \bash rvm-installer

Verification procedure is automatic for updates and it will fail to install new version with invalid signature. 

## Periodically refresh keys

It is a good practice to periodically refresh keys status to ensure  none of them got revoked. You can also add it to cron.

        gpg2 --refresh-keys
