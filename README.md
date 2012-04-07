# Welcome to the RVM Site Documentation

You can see the documentation live online at <https://rvm.io/>.

## Get the Site Running Locally

If you're going to help you'll first need to get the site running locally. Start by forking the repository and cloning the fork.

## Requirements

The site requires that you have at least ruby 1.9.2-p136 running in your environment. (Although you can manually use something else, this is what is setup in the `.rvmrc` file currently.)

You can do this with RVM by typing the following at the command line:

    rvm install 1.9.2

rvm-site requires a few gems that can be found in rvm-site.gems, including:

- [Compass](http://compass-style.org/)
- [HAML](http://haml-lang.com/) ([SASS](http://sass-lang.com/) is bundled with this Gem)
- [Nanoc3](http://nanoc.stoneship.org/)
- [Rack](http://guides.rubyonrails.org/rails_on_rack.html)
- [Mime-type](http://rubyforge.org/projects/mime-types/)

To install the gemset file, use

    rvm gemset import rvm-site.gems


## Getting it Running

If you are in RVM and have 1.9.2 already running,
simply clone this repository and cd to the directory.
The project `.rvmrc` will be loaded and you can open in your editor and start
hacking away.

If you would like to view the changes locally as you hack,
You can use Nanoc's AutoCompile feature:

	nanoc3 aco

## Update Submission

Once you are satisfied with your changes to the documentation push it back to your github fork and initiate a pull request.

## Thanks

Thanks for taking the time to work on the RVM documentation project!
