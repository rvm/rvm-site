---
title: "RVM with Vagrant"
---

# Using RVM with Vagrant

Use those shell scripts to tell Vagrant to install RVM upon `vagrant up` and
`vagrant provision`. Note that this will install RVM for the `vagrant` user.

If you want to perform a multi-user installation then you will need to:

1. In `Vagrantfile`: remove `privileged: false` from the RVM related lines.
2. In `install-ruby.sh`: change `$HOME/.rvm/scripts/rvm` to `/usr/local/rvm/scripts/rvm`

1. `Vagrantfile`:

        config.vm.provision :shell, path: "install-rvm.sh", args: "stable", privileged: false
        config.vm.provision :shell, path: "install-ruby.sh", args: "1.9.3", privileged: false
        config.vm.provision :shell, path: "install-ruby.sh", args: "2.0.0 rails haml", privileged: false

2. `install-rvm.sh`:

        #!/usr/bin/env bash

        gpg --keyserver hkp://keys.openpgp.org --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
        curl -sSL https://get.rvm.io | bash -s $1

This will automatically install RVM (update if already installed). In case you encounter an issues with importing gpg keys, check [security](/rvm/security).

3. `install-ruby.sh`:

        #!/usr/bin/env bash

        source $HOME/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh

        rvm use --default --install $1

        shift

        if (( $# ))
        then gem install $@
        fi

        rvm cleanup all

This will automatically install Ruby version given as the parameter.
Optionally, it can install gems if specified after the version of Ruby.

# Resources

- [Vagrant](http://vagrantup.com/)
- [Vagrantbox.es](http://www.vagrantbox.es/)
