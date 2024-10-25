# dotfiles

[shenxianpeng's dotfiles](https://github.com/shenxianpeng/dotfiles) was written as Ansible roles.

Sets up a full local development environment with a **single command.**

## A few features

- Pluggable. Everything is optional. Fork this. Remove what you don't use. Configure what you do use.
- Useful git aliases, docker aliases.
- Useful tools like `bat`, `devbox`, `fzf`, `k9s`, `rg`.

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
  - `export GIT_SIGNING_KEY_ID=631262B829DDB506`.
- Edit `local_env.yml` as you see fit. Remove any roles you don't use. Edit roles that you do use.

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

## Notes

It was forked from [sloria/dotfiles](https://github.com/sloria/dotfiles).