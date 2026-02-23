# RVM site and documentation

You can see the documentation live online at <https://rvm.io>.

## Quick corrections

For small changes like single wording fixes it is enough to use GitHub builtin editor,
navigate to https://github.com/rvm/rvm-site/tree/master/docs, find the page to fix
and press the **Edit** button, try to give meaningful description so it is easier to
understand why this change is needed.

## Running site locally

If you're going to help you'll first need to get the site running locally. Start by
forking the repository and cloning the fork.

### Requirements

- [Node.js](https://nodejs.org/) >= 18

### Install

    npm install

### Run

Start the development server:

    npm start

Then open http://localhost:3000

### Build

Build the static site for production:

    npm run build

### Serve

Serve the production build locally:

    npm run serve

## Thanks

Thanks for taking the time to work on the RVM documentation project!
