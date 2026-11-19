# RVM site and documentation

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

- Ruby (see `.ruby-version`)
- [Nanoc 4](https://nanoc.app/) and the other gems in `Gemfile`

To install requirements run

    bundle install

### Run

Compile on every change and serve the site with live reload:

    bundle exec nanoc live

And then open http://localhost:3000

Validating site links integrity with Nanoc:

    bundle exec rake test

## Styles

The stylesheet is plain CSS, no preprocessor:

- `content/assets/css/tokens.css` holds every colour, font and spacing value
- `content/assets/css/base.css` holds the element defaults
- `content/assets/css/screen.css` holds the layout and components

## Thanks

Thanks for taking the time to work on the RVM documentation project!
