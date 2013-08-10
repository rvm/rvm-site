---
title: "RVM with Vagrant"
---

# Using RVM with Vagrant

Tell vagrant to install ruby

1. `Vagrantfile`:

        config.vm.provision :shell, :path => "install-rvm.sh",  :args => "stable"
        config.vm.provision :shell, :path => "install-ruby.sh", :args => "1.9.3"
        config.vm.provision :shell, :path => "install-ruby.sh", :args => "2.0.0 rails haml"

2. `install-rvm.sh`:

        #!/usr/bin/env bash

        curl -L https://get.rvm.io | bash -s $1

This will automatically install RVM (update if already installed)

3. `install-ruby.sh`:

        #!/usr/bin/env bash

        source /usr/local/rvm/scripts/rvm

        rvm use --install $1

        shift

        if (( $# ))
        then gem install $@
        fi

This will automatically install ruby given as the parameter.
Optionally it can install gems if speecified after ruby version.

# Resources

- [Vagrant](http://vagrantup.com/)
- [Vagrantbox.es](http://www.vagrantbox.es/)
