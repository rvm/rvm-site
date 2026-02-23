---
title: RVM inside Screen
---

.breadcrumbs
  %a{ :href => "/" }
    Documentation
  &nbsp;>&nbsp;
  %a{ :href => "/workflow/" }
    Workflow
  &nbsp;>&nbsp;
  %a{ :href => "/workflow/screen/" }
    GNU Screen
  %hr

%h1
  Using RVM inside GNU Screen
%p
  RVM should work out of the box with screen as long as you have your profiles configured correctly.
  The easiest way to ensure it's working is to make screen use a login shell by placing the following in your ~/.screenrc file:
%pre.code
  :preserve
    shell -${SHELL}

%p
  Read the explanation of what
  %a{:href=>"/support/faq/#shell_login"} Shell login
  means if in doubt or advised by other sites to not use it.
