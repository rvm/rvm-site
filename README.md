# Welcome to the RVM Site Documentation

You can see the documentation live online at <https://rvm.io/>.

## Quick corrections

For small changes like single wording fixes it is enough to use github builtin editor,
navigate to https://github.com/rvm/rvm-site/tree/master/content, find the page to fix and press the **Edit** button,
try to give meaningfull description so it is easier to understand why this change is needed.

## Get the Site Running Locally

If you're going to help you'll first need to get the site running locally. Start by forking the repository and cloning the fork.

## Requirements

The site requires that you have at least ruby 1.9.3-p194 running in your environment, currently used version is listed in Gemfile

You can do this with RVM by typing the following at the command line:

    rvm use . --install --create

rvm-site requires a few gems that can be found in `Gemfile`, including:

- [Compass](http://compass-style.org/)
- [HAML](http://haml-lang.com/) ([SASS](http://sass-lang.com/) is bundled with this Gem)
- [Nanoc3](http://nanoc.stoneship.org/)
- [Rack](http://guides.rubyonrails.org/rails_on_rack.html)
- [Mime-type](http://rubyforge.org/projects/mime-types/)

To install the gemset file, use

    bundle install


## Getting it Running

If you are in RVM and have 1.9.2 already running,
simply clone this repository and cd to the directory.
The project `.rvmrc` will be loaded and you can open in your editor and start
hacking away.

If you would like to view the changes locally as you hack,
You can use Nanoc's AutoCompile feature:

    nanoc autocompile

Validating site links integrity with nanoc:

    nanoc check external_links
    nanoc check internal_links

or, use rake via the default 'test' task, which compiles then checks links:

    rake


## Update Submission

Once you are satisfied with your changes to the documentation push it back to your github fork and initiate a pull request.

## Thanks

Thanks for taking the time to work on the RVM documentation project!
