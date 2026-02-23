---
title: "Copying gemsets."
---

.breadcrumbs
  %a{ :href => "/" }
    Documentation
  &nbsp;>&nbsp;
  %a{ :href => "/gemsets/" }
    Gemsets
  &nbsp;>&nbsp;
  %a{ :href => "/gemsets/copying/" }
    Copying Gemsets
  %hr

%p
  You can also copy a gemset from one ruby to another.
%pre.code
  :preserve
    $ rvm gemset copy 2.1.1@rails4 2.1.2@rails4

%p
  This does not require gemsets.
%pre.code
  :preserve
    $ rvm gemset copy 2.1.1 2.1.2
