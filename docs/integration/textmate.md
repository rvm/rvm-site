---
title: Textmate Integration with RVM
---

## TextMate

It is possible to support RVM gemsets in TextMate using the TM_RUBY environment variable.
Currently, RVM has two possible configurations out of the box - One, rvm-auto-ruby, that supports
automatically detecting the ruby based on the .rvmrc (where possible) and another using
RVM's built in wrapper functionality to generate a binary for a fixed ruby version.

For both of them, it's important to be up to date first - in recent versions, you can do this
using the following command:

```bash
$ rvm get head
```

You should also choose a default Ruby, for example to set 1.9.2 as your default

```bash
$ rvm --default use 1.9.2
```

### The rvm-auto-ruby approach

Out of the box, rvm ships with a ruby binary, typically in ~/.rvm/bin (or, in system wide installs,
inside of /usr/local/bin), that will perform the following steps before executing ruby:

1. Load up RVM
2. Look for any RVMRC files and load them
3. Execute as a normal ruby

This approach makes it possible to have the ruby switched on a per-project basis without any extra work.
With rvm installed, this is a matter of taking the full path to rvm-auto-ruby, found via:

```bash
$ which rvm-auto-ruby
```

And in the advanced section of the textmate preferences, either adding or changing the TM_RUBY
variable to point to the given path, like shown in
[this screenshot](http://cl.ly/23Yl)
with an example installation.

### The RVM wrapper approach

If you want your TextMate install to always use a single ruby and gemset combination, you'll
instead need to use the rvm wrapper approach. This generates a ruby binary that can used
by TextMate. To use this approach, first decide the ruby and gemset combination which you wish
to use. In our example, we'll go with `rbx@rails3` (Anything that can
be parsed by rvm use, e.g. ree, 1.8.7, 1.9.2@ninja-attack, will work with the wrapper command).

Next, you'll need to generate a command. The general structure of the rvm wrapper command is

```bash
$ rvm wrapper [ruby_string] [wrapper_prefix]
```

In our case, we thus run:

```bash
$ rvm wrapper rbx@rails3 textmate
```

This command will create a file in your rvm bin path (as mentioned earlier), called `textmate_ruby`
which we can for the value of TM_RUBY. So, opening up TextMate and going to the advanced panel of the textmate
preferences, add or change the TM_RUBY variable to the output of running `which textmate_ruby`
on the command line (e.g. /Users/wayne/.rvm/textmate_ruby).

Now quit textmate and re-open it for bundles and TM_RUBY settings to take effect.

### Testing out your wrapper

You can now test if it is working by following these steps

1. Open a new document
2. Put this code in the new document

    ```ruby
    puts RUBY_DESCRIPTION
    ```

3. Save the file as 'ruby_test.rb'
4. Press Command + R to run the ruby

If you see something like this "ruby 1.9.1p378 (2010-01-10 revision 26273) [i386-darwin10.2.0]"
most importantly the 'ruby 1.9.1' part then it is working as expected.

When you wish to switch out the ruby version that textmate uses by default,
you can change your default RVM ruby version as follows

```bash
$ rvm use rbx@rails3 --default
```

RVM will also switch out the ruby version and gemset based on each project's .rvmrc file

### Automating the wrapper command

If you wish for TextMate's Ruby to switch each time rvm changes the current Ruby, then you can
enable the "after_use_textmate" hook in rvm's hooks directory by making the script file executable:

```bash
$ cd ~/.rvm/hooks
$ chmod +x after_use_textmate
```

Now, when you switch into a project directory and rvm auto-switches Ruby, TextMate will be ready to Run
with the now current binaries. Just be mindful of the side-effects of switching to directories of projects
other than the principal project you're working on as TextMate's Ruby environment will change accordingly!

### Making sure TextMate is up to date

Next, make your textmate is latest version and run the following script to update all your the bundles

```bash
#!/usr/bin/env bash

mkdir -p /Library/Application\ Support/TextMate/

sudo chown -R $(whoami) /Library/Application\ Support/TextMate

cd /Library/Application\ Support/TextMate/

if [[ -d Bundles/.svn ]] ; then
  cd Bundles && svn up
else
  if [[ -d Bundles ]] ; then
    mv Bundles Bundles.old
  fi
  svn co http://svn.textmate.org/trunk/Bundles
fi

exit 0
```

## Notes

To change the TM_RUBY shell variable, In TextMate use the menu to navigate to:

```
Textmate | Preferences | Advanced | Shell Variables
```

If you have issues, you may need to change the bundler Builder.rb in TextMate. Since TextMate will use it's own builder,
by removing it, we can use TM_RUBY as specified above (Thanks Seivan Heidari!):

```bash
cd /Applications/TextMate.app/Contents/SharedSupport/Support/lib/ ; mv Builder.rb Builder.rb.backup
```

If you need to update osx-plist for Ruby 1.9.X compatibility, this might be of some use:

```bash
git clone git://github.com/kballard/osx-plist.git
cd osx-plist/ext/plist
ruby extconf.rb && make
cp plist.bundle /Applications/TextMate.app/Contents/SharedSupport/Support/lib/osx/
```

If you have issues with Ruby 1.9+, namely:

```
ruby:0:in `require': /Users/someuserhere/Library/Application Support/TextMate/Bundles/Ruby.tmbundle/Support/RubyMate/catch_exception.rb:13: invalid multibyte char (US-ASCII) (SyntaxError)
```

You either need to check for updated versions of your bundles or manually edit the file in question, adding the following at the top of the file:

```ruby
# encoding: utf-8
```

Which forces Ruby to read the file with the correct text encoding, allowing multibyte characters.
The alternative solution is to for ruby 1.9.X to always be run in UTF-8 mode when called via textmate_ruby.
To do this, edit the textmate_ruby file and replace the line containing:

```bash
exec ruby "$@"
```

With a new line containing:

```bash
exec ruby -wKU "$@"
```

## Miscellaneous

You can create a shell function to open a project directory with files excluded.
Here is a simple example of this idea:

The above function code (minus the first line) is placed in your dotfiles or
~/.bash_profile if you do not maintain dotifiles.
