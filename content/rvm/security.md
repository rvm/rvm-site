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

    gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

If you encounter problem with the key server above, try a different one. Some alternatives are presented below:

* hkp://ipv4.pool.sks-keyservers.net
* hkp://pgp.mit.edu
* hkp://keyserver.pgp.com

### Firewall issues

In case importing gpg keys hangs forever, it might be that's a firewall issue. If you are behind a firewall, make sure you open outgoing port 11371 (TCP).

### IPv6 issues

It is known issue that if your host does not have IPv6 enabled (often happening in docker containers) some key servers might fail to connect. You can forbid gpg's internal `dirmngr` from using IPv6 by add the following line to `~/.gnupg/dirmngr.conf`:

    disable-ipv6
    
Make sure no existing `dirmngr` processes are still running (and kill them if they are), and then try `gpg --recv-keys` command again as specified originally, and it should work.

Note that the risk here is that if you really do need IPv6 later at some point, you may forget about this setting, but for most people this is unlikely.

### Alternatives

Alternatively you might want to import keys directly from our web server, although this is a less secure way:

    curl -sSL https://rvm.io/mpapis.asc | gpg --import -
    curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

### Keybase

Identity of our keys can be confirmed at [keybase.io](https://keybase.io):

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
