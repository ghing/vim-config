# Vim configuration

This is my vim configuration.

## Deployment

I use [fresh](https://freshshell.com) and pull this in from my [dotfiles](https://github.com/ghing/dotfiles).

So, after pushing changes to the Vim configuration in this repo, run:

```
fresh update
```

## Components

TODO: Update this with other information about parts of the configuration.

### Snippets

Snippets for use with the UltiSnips plugin are in the `UltiSnips` directory. These aren't currently being automatically installed or synced, but I wanted to start tracking them in this repository.

I did the initial copy like this:

```
rsync -avh ~/.vim/UltiSnips/ ./UltiSnips/
```

TODO: Figure out some deployment strategy.

### Package management

I use [Vundle](https://github.com/VundleVim/Vundle.vim) for package management.

### JavaScript linting and formatting 

Lint and format JavaScript using [ESLint](https://eslint.org/) and [Prettier](https://prettier.io/).

I based my configuration on this post: [Configuring ESLint and Prettier for Vim](https://davidtranscend.com/blog/configure-eslint-prettier-vim/).

It uses [Asynchronous Lint Engine](https://github.com/w0rp/ale) (ALE) to run ESLint.
