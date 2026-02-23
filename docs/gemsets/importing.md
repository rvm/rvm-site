---
title: "'rvm gemset import' - Importing gemsets."
---

.breadcrumbs
  %a{ :href => "/" }
    Documentation
  &nbsp;>&nbsp;
  %a{ :href => "/gemsets/" }
    Gemsets
  &nbsp;>&nbsp;
  %a{ :href => "/gemsets/importing/" }
    Importing Gemsets
  %hr

%h3
  Importing a gemset
%p
  To import a gemset file called 'teddy.gems' to the teddy gemset of 2.1.1 do
%pre.code
  :preserve
    $ rvm --create 2.1.1@teddy # The --create creates the gemset if it does not exist
    $ rvm gemset import teddy
%p
  Note that you can use any gemset name to import into.
%p
  You can specify the gemset filename prefix also
%pre.code
  :preserve
    $ rvm gemset use teddy
    $ rvm gemset import teddy
%p
  Alternatively, if you already have a ruby and/or gemset selected:
%pre.code
  :preserve
    $ rvm 2.1.1@teddy
    $ rvm gemset import
%p
  Importing without arguments will check for gemset files in the following order:
  %ul
    %li
      A gemset file with the current gemset name prefix in the current directory
    %li
      RVM then checks for 'default.gems' in the current directory
    %li
      Next RVM looks for a 'system.gems' in the current directory.
    %li
      Finally RVM looks for a '.gems' file in the current directory
%p
  gemset files have the following format, particularly for denoting versions:
%pre.code
  :preserve
    fastercsv
    rails -v4.1.0
    rake
    tzinfo -v0.3.27
%p
  You might also be interested in
  %a{:href => "/gemsets/copying/"}
    Copying
  gemsets from one rvm ruby[@gemset] to another.
