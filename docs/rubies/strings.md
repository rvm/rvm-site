---
title: "'rvm string' - Expanding Ruby selectors to their full ruby string."
---

.breadcrumbs
  %a{ :href => "/" }
    Documentation
  &nbsp;>&nbsp;
  %a{ :href => "/rubies/" }
    Rubies
  &nbsp;>&nbsp;
  %a{ :href => "/rubies/info/" }
    Ruby String

%h1
  Ruby String
%p
  RVM uses the concept of a 'ruby string' to uniquely identify each interpreter installation.
  Most commonly this is of the form $interpreter-$version-$distinguisher.
  For example 'ruby-1.9.1-p378' stands for "Ruby 1.9.1 patch level 378".
%p
  If you are developing tools which use RVM and you need a way to expand ruby selectors to their full ruby strings then you can do it like so:
%pre.code
  :preserve
    rvm strings 1.8.7
%p
  This will produce output similar to:
%pre.code
  :preserve
    ruby-1.8.7-p249
%p
  You may also pass multiple selectors:

%pre.code
  :preserve
    rvm strings 1.8.7 1.9.1 jruby
%p
  Which yields something like,
%pre.code
  :preserve
    ruby-1.8.7-p249 ruby-1.9.1-p378 jruby-1.4.0

%h2
  Overriding Defaults
%p
  RVM tracks the latest stable patchlevels for each release.  If you want to override this,
  for example, so you could make '1.8.7' to resolve to 'ruby-1.8.7-p302' instead of the
  latest patchlevel, you can edit the config/user file, which will override the settings
  in config/db and persist across installs and updates of rvm itself.
