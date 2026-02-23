---
title: "'rvm gemset empty' - Emptying gemsets"
---

.breadcrumbs
  %a{ :href => "/" }
    Documentation
  &nbsp;>&nbsp;
  %a{ :href => "/gemsets/" }
    Gemsets
  &nbsp;>&nbsp;
  %a{ :href => "/gemsets/emptying/" }
    Emptying Gemsets
  %hr

%p
  If you empty a gemset, rvm will prompt you for confirmation.
  This action removes all gems installed in the gemset.
%pre.code
  :preserve
    $ rvm gemset use albinochipmunk
    $ rvm gemset empty albinochipmunk

%p
To skip confirmation, pass the --force flag:
%pre.code
  :preserve
    $ rvm gemset use albinochipmunk
    $ rvm --force gemset empty albinochipmunk
