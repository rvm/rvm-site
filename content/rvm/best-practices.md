---
title: "RVM Best Practices"
---

RVM Best Practices
==================

Want to use RVM the way Wayne E. Seguin intended? The following is a collection of tips and best practices that have proven to be effective in making development easier while using rvm.

The List
--------

### No. 1 - Use rvmrc files for each of your individual projects.

A [project-specific rvmrc](/workflow/rvmrc/) makes it easy to automate your general workflow. Not only does it let you automatically switch rubies when you work on your app, but it also makes it easy to automatically bootstrap environments.

### No. 2 - Check your rvmrc into source control.

By checking the project's' rvmrc into source control along side your app, you're ensuring all users have a consistent environment when they're using your project and RVM.

By also automating gemset installs and the like (e.g. check out the rvmrc in the [rvm-site](http://github.com/rvm/rvm-site) repository or the [TEDxPerth](http://github.com/YouthTree/TEDxPerth) repostory's rvmrc) you also make bootstrapping a project happen via cd'ing into the project directory, provided you have `export rvm_project_rvmrc=1` in your `$HOME/.rvmrc`.

On top of this, you can also automatically make your deployments set up your application-specific environment even if you're using [passenger](/integration/passenger/).

### No. 3 - Use per-project gemsets.

Per-project gemsets are used such that each application has its own distinct gem environment, helping you to avoid issues that come about from conflicting versions. In most cases, this involves using something like "ree@your-app" instead of "ree" when selecting a ruby (e.g. in your rvmrc).

Even better, tying it into No. 1 and No. 2 means that you and any other users automatically have correctly versioned gemsets. If you are using bundler, RVM will even set BUNDLE_PATH for you so your gem directory is in the same place as bundler places its gems.

### No. 4 - Deploy with rvm when possible.

Not only is *developing with RVM a good idea, when possible, it is also a good idea to *deploy* your application using RVM. This brings about the usual advantages of an application-specific environment, but also makes it easier to track down version-specific bugs that occur in production later on in development. This is primarily since it ensures a reasonably consistent environment between the two.

Even better, when it comes time to upgrade your ruby, RVM can help you with this via the 'rvm upgrade' command.

### No. 5 - Integrate RVM into your tools of choice.

Lastly, make sure you read our [integration](/integration/) pages to find out how best to integrate RVM into your development and deployment ecosystem.
