---
title: rvm-prompt
---

# rvm-prompt

To display the current ruby selection string in your prompt add this to your profile:

```
PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"
```

By default rvm-prompt outputs the fully qualified ruby string necessary to select the particular ruby currently selected and nothing when system ruby is selected. You can change this default behavior and control the verbosity of rvm-prompt by combining the following parameters:

```
(i)nterpreter  - interpreter abreviation    (default)
(v)ersion      - version                    (default)
(p)atchlevel   - patch level                (default)
(g)emset       - current gemset             (default)
(r)evision     - revison
(a)rchitecture - architecture
(u)nicode      - single unicode character representation of interpreter
(s)ystem       - echo "system" when using system ruby
```

Below are some examples of running rvm-prompt with various arguments on different rubies.

```
$ rvm 1.9.1 ; rvm-prompt i v p g # default

  ruby-1.9.1-p243

$ rvm 1.9.1@rails ; rvm-prompt i v p g # default

  ruby-1.9.1-p243@rails

$ rvm ree-1.8.7 ; rvm-prompt i v

  ree-1.8.7

$ rvm jruby ; rvm-prompt v i

  1.5.1-jruby

$ rvm jruby ; rvm-prompt u

  ☯

$ rvm system ; rvm-prompt



$ rvm system ; rvm-prompt s i v p

  system
```

# ps1_functions

Recently there has been a pair programming session that turned out a useful bit of prompt setting code. It now resides in contrib/ so you can require it in your profiles as follows after sourcing RVM itself.

```
source "$rvm_path/contrib/ps1_functions"
```

Immediately after that you can customize your prompt by adding the following line

```
ps1_set
```

There is an article and screen cast associated with this in the community resources section.
