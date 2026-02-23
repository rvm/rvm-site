---
title: "'rvm gemset create' - Creating gemsets"
---

.breadcrumbs
  %a{ :href => "/" }
    Documentation
  &nbsp;>&nbsp;
  %a{ :href => "/gemsets/" }
    Gemsets
  &nbsp;>&nbsp;
  %a{ :href => "/gemsets/creating/" }
    Creating
  %hr

%h1
  Creating gemsets
%p
  Gemsets must be created before being used.
  To create a new gemset for the current ruby, do this:

%pre.code
  :preserve
    $ rvm 2.1.1
    $ rvm gemset create teddy
    Gemset 'teddy' created.
%p
  You can also create multiple gemsets in a single command.

%pre.code
  :preserve
    $ rvm 2.1.1
    $ rvm gemset create teddy rosie
    Gemset 'teddy' created.
    Gemset 'rosie' created.

%p
  Alternatively, if you prefer the shorthand syntax
  offered by rvm use, employ the --create option
  like so:

= sh_cmd "rvm use 2.1.1@teddy --create"

%p
  If you would like to create gemsets automatically when used, export this flag in your ~/.rvmrc or /etc/rvmrc file:
%pre.code
  :preserve
    rvm_gemset_create_on_use_flag=1
