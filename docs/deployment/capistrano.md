---
title: "RVM with Capistrano"
---

# Using RVM with Capistrano

## Benefits of integration

Integrating RVM with Capistrano provides the normal benefits of RVM when
operating in the context of Capistrano deployment tasks.  These include:

a. Ensuring all Capistrano tasks use the correct
   Ruby and gems (including gemset support).

b. Automatic [installation of RVM](/rvm/install/) and Ruby via Capistrano. Only possible when using rvm-capistrano gem, explained as option 1
   [below](#gem).

c. [Manage gemsets](/gemsets/basics) via Capistrano, allowing you to install or update project gems as part of your deployment.

## Integration choices

There are four choices, listed below from newest to oldest.  The first is
preferred because it reduces configuration and does not contain hardcoded
paths.

1. With RVM >= 1.11.3, use the [rvm-capistrano gem](#gem).

2. With older RVM but still >= 1.0.1, use the built-in capistrano [plugin](#native-plugin) (it is *not* a gem).

3. Use the capistrano `:default_environment` [setting](#environment).

4. Use the sshd `PermitUserEnvironment` option to permit configuration via the `$HOME/.ssh/environment` file. *Unfortunately this is not yet documented.*

## Use the rvm-capistrano gem

Please refer to the [gem](https://github.com/rvm/rvm-capistrano).
Note that in this configuration RVM **will not**
be automatically loaded as a shell function, although the executable will be available
in the `PATH`. For the differences between the situations, please see
[scripting](/workflow/scripting/).

## Use the built-in capistrano plugin (outdated)

RVM >= 1.0.1 includes a built-in plugin (*not* a gem) for capistrano
support.  This configuration is nearly identical to the
[gem](#gem)
approach above, except that an extra line is required to add RVM's lib
directory to the load path so that the plugin can be found:

```ruby
# Choose a Ruby explicitly, or read from an environment variable.
set :rvm_ruby_string, 'ree@rails3'
# set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,'')

# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.
require 'rvm/capistrano'
```

Please note, by default the plugin uses a *system* installation of
RVM, which is the exact opposite of the gem's default installation mode.  To
instead set it to use a per-user (non-root) install, add the following to
either your `Capfile` or `deploy.rb`:

```ruby
set :rvm_type, :user  # Literal ":user"
```

## Use the Capistrano :default_environment setting (hardcore)

For this option, add the following line in your `deploy.rb` file, adjusting to your particular rvm ruby of course:

```ruby
set :default_environment, {
  'PATH' => "/path/to/.rvm/gems/ree/1.8.7/bin:/path/to/.rvm/bin:/path/to/.rvm/ree-1.8.7-2009.10/bin:$PATH",
  'RUBY_VERSION' => 'ruby 1.8.7',
  'GEM_HOME'     => '/path/to/.rvm/gems/ree-1.8.7-2010.01',
  'GEM_PATH'     => '/path/to/.rvm/gems/ree-1.8.7-2010.01',
  'BUNDLE_PATH'  => '/path/to/.rvm/gems/ree-1.8.7-2010.01'  # If you are using bundler.
}
```

To get the accurate locations have a look inside `~/.rvm/config/default`

To configure Capistrano to automatically trust project `.rvmrc` files on deployment, add the following to your `config/deploy.rb`:

```ruby
namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end
```

And then use Capistrano's hooks capabilities, by adding an `after` hook to launch it.

```ruby
after "deploy", "rvm:trust_rvmrc"
```
