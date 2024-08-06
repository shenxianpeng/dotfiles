# dotfiles

[shenxianpeng's dotfiles](https://github.com/shenxianpeng/dotfiles) was written as Ansible roles.

Sets up a full local development environment with a **single command.**

It was forked from [sloria/dotfiles](https://github.com/sloria/dotfiles).

## A few neat features

- zsh configured with [prezto](https://github.com/sorin-ionescu/prezto).
- nice fonts for the terminal and coding.
- python3, pipx (for managing python CLIs), pyenv (for managing Python versions), and pyenv-virtualenv (for managing virtualenvs)
- a tmux.conf that's pretty neat.
- vim with [vim-plug](https://github.com/junegunn/vim-plug) for plugin management. All configuration in a single file [.vimrc](https://github.com/shenxianpeng/dotfiles/blob/master/roles/vim/files/vimrc).
- pluggable. Everything is optional. Fork this. Remove what you don't use. Configure what you do use.
- Mac packages installed with [homebrew][]. Mac apps installed with [homebrew-cask][] and [mas][].
- Useful git aliases
- Optional git commit signing with GPG

## Prerequisites

- homebrew (If on macOS) - **Install this first**
- git: `brew install git`
- ansible >= 1.6: `brew install ansible`

## Install

- [Fork](https://github.com/shenxianpeng/dotfiles/fork) this repo.
- Clone your fork.

```bash
# Replace git url with your fork
# NOTE: It is important that you clone to ~/dotfiles
git clone https://github.com/YOUR/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

- Update the following variables in `group_vars/local` (at a minimum)
  - `full_name`: Your name, which will be attached to commit messages, e.g. "Xianpeng Shen"
  - `git_user`: Your Github username.
  - `git_email`: Your git email address.
- Optional, but recommended: Update `group_vars/local` with the programs you want installed by [homebrew][], [homebrew-cask][], and npm.
  - `mac_homebrew_packages`: Utilities that don't get installed by the roles.
  - `mac_cask_packages`: Mac Apps you want installed with [homebrew-cask][].
- Edit `local_env.yml` as you see fit. Remove any roles you don't use. Edit roles that you do use.
- Optional: If you want to sign Git commits with a GPG key, follow the
  instructions [here](https://github.com/pstadler/keybase-gpg-github)
  to generate a GPG key from Keybase. Then set the
  `GIT_SIGNING_KEY_ID` environment variable before running the
  `dot-bootstrap` script.

```
export GIT_SIGNING_KEY_ID=631262B829DDB506
```

Note: After running the dot-bootstrap script, you should put the above
line in `~/.localrc`.

- Run the installation script.

```bash
./bin/dot-bootstrap
```

## Updating your local environment

Once you have the dotfiles installed you can run the following command to rerun the ansible playbook:

```bash
dot-update
```

You can optionally pass role names

```bash
dot-update git python
```

## Commands

There are three main commands in the `bin` directory for setting up and updating development environments:

- `dot-bootstrap`: sets up local environment by executing all roles in `local_env.yml`.
- `dot-update`: updates local environment by executing all roles in `local_env.yml` except for the ones tagged with "bootstrap".
- `devbox init`: Initialize Devbox

## Special files

All configuration is done in `~/dotfiles`. Each role may contain (in addition to the typical ansible directories and files) a number of special files

- **role/\*.zsh**: Any files ending in `.zsh` get loaded into your environment.
- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made available everywhere.

## Notes

**vscode**

Use built-in Settings Sync to sync VSCode settings.
