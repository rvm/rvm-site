---
title: Debugging RVM
---

.breadcrumbs
  %a{ :href => "/" }
    Documentation
  &nbsp;>&nbsp;
  %a{ :href => "/development/" }
    Development
  &nbsp;>&nbsp;
  %a{ :href => "/development/debugging/" }
    Debugging
  %hr

%h2 Debugging RVM

%p
  If you encounter an issue with rvm, you can make it greatly easier
  for us by following the steps below. Each one helps provide
  additional insight into what is going wrong.

%h3 Tracking Down Bugs

%p
  If you do encounter a bug, the first (and most important) information we need
  is related to how rvm is loaded. You should first confirm that rvm is loaded as a function.
  Do this by running:

= sh_cmd "type rvm | head -1"

%p
  which should output "rvm is a function". If it shows anything else, rvm isn't
  loading correctly. For information on why this occurs, and how to solve it,
  please see
  %a{:href => "/rvm/install/"} the bottom of the Installation instructions.

%p
  Next, we'll need two sets of information. Namely, the output
  of running 'rvm debug', like so:

= sh_cmd "rvm debug"

%p
  And the output of running the broken command
  %em with the trace option
  , e.g. if you're having a use problem:

= sh_cmd "rvm use ree"

%p
  you would need to try running it as:

= sh_cmd "rvm --trace use ree"

%p
  To share this information use:
  %a{:href => "http://gist.github.com/"} GitHub's Gist

%h3 Reporting Bugs

%p
  First, please ensure you've read
  %a{:href => "http://www.chiark.greenend.org.uk/~sgtatham/bugs.html"} "How to Report Bugs Effectively"
  in order to speed up the whole process.

%p
  Report the bug on the project's
  %a{:href => "https://github.com/rvm/rvm/issues"} GitHub Issues
  page.
