# RVM site  and documentation

You can see the documentation live online at <https://rvm.io>.

## Quick corrections

For small changes like single wording fixes it is enough to use GitHub builtin editor,
navigate to https://github.com/rvm/rvm-site/tree/master/content, find the page to fix
and press the **Edit** button, try to give meaningful description so it is easier to
understand why this change is needed.

## Running site locally

If you're going to help you'll first need to get the site running locally. Start by
forking the repository and cloning the fork.

### Requirements

This site requires a few gems that can be found in `Gemfile`, including:

- [MIME::Types](https://github.com/halostatue/mime-types#readme)
- [Compass](http://compass-style.org/)
- [Nanoc](https://nanoc.ws/)
- [Rack](https://rack.github.io/)
- [Haml](http://haml.info/) ([Sass](http://sass-lang.com/) is bundled with this Gem)

To install requirements run

    bundle install

### Run 

If you would like to view the changes locally as you hack, use nanoc-guard:

    # in window/tab 1
    guard
    # in window/tab 2
    nanoc view
    
And then open http://localhost:3000

It's required to reload page after changing code.

Validating site links integrity with Nanoc:

    rake test

## Thanks

Thanks for taking the time to work on the RVM documentation project!
