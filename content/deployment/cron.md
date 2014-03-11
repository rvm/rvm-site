---
title: "Using Cron with RVM"
---

# Using RVM with Cron

RVM allows few easy ways to integrate with cron

1. [Direct calling RVM generated wrappers.](#direct)
2. [Loading RVM environment files in shell scripts.](#environment)
3. [Direct calling custom RVM wrappers (eg. God).](/deployment/god/)
4. [Loading and using RVM in shell scripts.](/workflow/scripting/)

<a name="direct"></a>
## Direct calling RVM generated wrappers

For every installed ruby and created gemset RVM creates wrappers for
basic command line tools like `gem`, `rake`, `ruby`. You can find them
in `$rvm_path/wrappers/<ruby-version>[@gemset-name]`.

So when the project ruby is `2.1.1@projectX` then the following
cron entries will work using the proper environment:

    1 0  * * * /usr/local/rvm/wrappers/ruby-2.1.1@projectX/ruby /path/to/script.rb
    1 15 * * * /usr/local/rvm/wrappers/ruby-2.1.1@projectX/rake update stats


### Aliases

To simplify future changes of ruby version use aliases, it's the
simplest way to ensure that configuration does not have to change when
ruby version changes:

    rvm alias create my-project ruby-2.1.1@projectX

then you can use the aliased path:

    1 15 * * * /usr/local/rvm/wrappers/my-project/rake update stats


<a name="environment"></a>
## Loading RVM environment files in shell scripts

For every installed ruby and created gemset RVM creates environment
files. You can find them by running:

    rvm env --path -- ruby-version[@gemset-name]

Assuming the the project ruby@gemset is `1.9.2-p290@projectX` then
calling:

    rvm env --path -- 1.9.2-p290@projectX

will return

    /usr/local/rvm/environments/ruby-1.9.2-p290@projectX

### Example script

Basic shell script for interacting with rvm installed ruby would look
like this:

    #!/usr/bin/env bash

    # load rvm ruby
    source /usr/local/rvm/environments/ruby-1.9.2-p290@projectX

    bundle install
    ruby /path/to/script.rb
    rake do something
