# Welcome to the RVM Site Documentation

You can see the documentation live online at <https://rvm.io/>.

## Quick corrections

For small changes like single wording fixes it is enough to use Github builtin editor,
navigate to https://github.com/rvm/rvm-site/tree/master/content, find the page to fix
and press the **Edit** button, try to give meaningful description so it is easier to
understand why this change is needed.

## Get the Site Running Locally

If you're going to help you'll first need to get the site running locally. Start by
forking the repository and cloning the fork.

## Requirements

The site relies on a specific version of Ruby, which is listed in the Gemfile.
You can run install it with:

    rvm use . --install --create

rvm-site requires a few gems that can be found in `Gemfile`, including:

- [MIME::Types](https://github.com/halostatue/mime-types#readme)
- [Compass](http://compass-style.org/)
- [Nanoc](https://nanoc.ws/)
- [Rack](https://rack.github.io/)
- [Haml](http://haml.info/) ([Sass](http://sass-lang.com/) is bundled with this Gem)

To install the gemset file, use

    bundle install

## Getting it Running

If you are in RVM and have the proper version of Ruby running already,
simply clone this repository and cd to
the directory. The project `.rvmrc` will be loaded and you can open in your editor and
start hacking away.

If you would like to view the changes locally as you hack, use nanoc-guard:

    # in window/tab 1
    guard
    # in window/tab 2
    nanoc view

It's required to reload page after changing code.

Validating site links integrity with Nanoc:

    rake test

## Update Submission

Once you are satisfied with your changes to the documentation push it back to your Github fork
and initiate a pull request.

## Thanks

Thanks for taking the time to work on the RVM documentation project!
