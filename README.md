# customizations

This repo is where I keep the shell, Git, and editor customizations that make my day-to-day development smoother. I started it for myself, but the goal is for it to be useful as a public toolbox that other people can borrow from, copy selectively, or adapt to their own setup.

The problems this repo tries to solve are simple: too much repeated terminal setup, too much Git friction, and too many small workflow steps that add up over time.

## What's here right now

At the moment, this repo includes:

- `git-aliases/for-branches`: a Git config snippet with aliases I use for everyday branch work
- `git-aliases/for-worktrees`: a smaller Git config snippet for worktree-oriented workflows
- `git-aliases/.functions`: shell functions for navigation, Python environment setup, CSV inspection, Git/worktree workflow helpers, and a safer `rm` that moves files to Trash instead of deleting them outright
- `git-aliases/.vimrc`: a lightweight Vim config with indentation defaults, color tweaks, pane navigation mappings, and `NERDTree` via `vim-plug`

This repo will grow over time. Right now it is Git-heavy because that is where most of my reusable setup already lives, but the intent is broader than Git alone.

## How I use it

I treat this repo as a source of reusable snippets, not as a one-shot installer. You can use it however you prefer:

- Copy the parts you want into your own dotfiles
- Keep this repo checked out somewhere and include pieces from it
- Start with one file and adapt it to your own conventions

For Git config, two common approaches are:

1. Copy the relevant sections into `~/.gitconfig`
2. Include one of these files from `~/.gitconfig`, for example:

```ini
[include]
    path = /absolute/path/to/customizations/git-aliases/for-branches
```

For shell functions, source the file from your shell startup file:

```sh
source /absolute/path/to/customizations/git-aliases/.functions
```

For Vim, either copy settings you want into your own `~/.vimrc` or source this one from there.

## A few useful things inside

Some of the helpers I reach for most often:

- `mkcdir`: create a directory and immediately `cd` into it
- `headers`: print CSV headers one per line with line numbers
- `makenv`: create a Python virtualenv based on the current directory name
- `git co`: jump between the main workspace checkout and branch-specific worktrees
- `git cob`: create a new branch as a worktree and set it up for pushing
- `git com` / `git compull`: jump back to `main` or `master`, optionally pulling
- `git pulled`: pull latest changes, remove the current worktree, delete the branch, and offer pruning
- `rm`: move files to `~/.Trash` instead of permanently deleting them

## Caveats

Some of this is intentionally opinionated. Before you adopt any of it, read it and decide whether the assumptions match your environment.

- The `git()` shell function and everything in `git-config/for-worktrees` assume a repo layout under `~/workspace` and `~/worktrees`
- `git cob` and `compush` can push automatically, which is convenient for me but may be too aggressive for your workflow
- The custom `git()` shell function overrides the normal `git` command for certain subcommands
- The custom `rm()` function changes deletion behavior by moving files to `~/.Trash`
- Some functions assume tools like `pyenv`, `newsboat`, `vim`, `meld`, `python`, or `vim-plug` are available
- The Vim config will try to bootstrap `vim-plug` and install `NERDTree`

## Recommended approach

I would not suggest cloning this repo and blindly sourcing everything. The better approach is:

1. Read the files
2. Copy the parts that solve a problem you actually have
3. Rename or rewrite anything that feels too coupled to my setup

If a customization here saves you a few keystrokes or removes a little workflow friction, then it is doing its job.
