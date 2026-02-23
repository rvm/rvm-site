---
title: Culerity Integration with RVM
---

## Culerity Integration with RVM

If you wish to use an rvm-based ruby and jruby with Culerity,
please follow the steps below. Note that the first set of instructions
currently rely on you using recent versions.

## Setting up jruby

Before you can start, you need to install jruby and celerity. In a nutshell, you need to:

1. Install jruby:

```bash
$ rvm install jruby
```

2. Create a celerity gemset and use it:

```bash
$ rvm use jruby@celerity --create
```

3. Install the celerity gem in this gemset:

```bash
$ gem install celerity culerity
```

Which this done, you should be able to confirm that you have celerity by doing:

```bash
$ gem list | grep celerity
```

With this done, the next key step is to set up a wrapper for it. To do this, we run:

```bash
$ rvm wrapper jruby@celerity celerity jruby
```

You can set the path for culerity can now be set via environment variable in your .bash_profile or such:

```bash
$ export JRUBY_INVOCATION="$(readlink "$(which celerity_jruby)")"
```

Which should create the file ~/.rvm/bin/celerity_jruby, pointing to the correct ruby. You
can verify this by doing:

```bash
$ celerity_jruby -S gem list | grep celerity
```

Assuming this is correct, you can move on to the next step.

## Configuring Culerity to use your jruby Celerity

Once you've generated the wrapper, your next task is to tell Culerity which
jruby to use. If you are on a recent version, you add the following code
snippet to the project's features/support/env.rb file:

```ruby
Culerity.jruby_invocation = File.expand_path("~/.rvm/bin/celerity_jruby")
```

Replacing ~/.rvm/bin with whatever "echo $rvm_bin_path" shows on your terminal
if it fails
(Thanks to Matt Patterson for making this more clear on the Culerity's side).

On older versions of Culerity, you need to manually specify hooks to toggle the env.
In order to do this, you need to first get the location of the jruby wrappers dir. To find
this, run the following in your Terminal and note the output:

```bash
$ dirname "$(readlink "$(which celerity_jruby)")"
```

Which should return something similar to "/Users/sutto/.rvm/wrappers/jruby-1.5.1@celerity"
as an example. Next, you need to create features/support/culerity-hooks.rb containing
the following code (with thanks to agibralter, mchung and ashleymoran):

```ruby
# culerity-hooks.rb
Before("@culerity,@celerity,@javascript") do |scenario|
  unless @original_path && @rvm_jruby_path
    @original_path  = ENV['PATH']
    @rvm_jruby_path = "/Users/sutto/.rvm/wrappers/jruby-1.5.1@celerity:#{@original_path}"
  end
  ENV['PATH'] = @rvm_jruby_path
end

After("@culerity,@celerity,@javascript") do |scenario|
  ENV["PATH"] = @original_path
end
```

Ensuring you replace "/Users/sutto/.rvm/wrappers/jruby-1.5.1@celerity" with the value you noted
earlier.

# Community Resources

- This [Google Groups post](https://groups.google.com/forum/?fromgroups=#!topic/culerity-dev/RbNweba24UM) by Matt Patterson announcing his patches with improved support.
- These [awesome hooks](http://gist.github.com/353514) from above exhibit proper scripting usage of RVM info as intended, awesomely done agibralter. [correction by ashleymoran](http://gist.github.com/404870) - Originally the preferred solution
- Original [gist by mchung](http://gist.github.com/268216)
