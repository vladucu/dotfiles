# Dotfiles

I've wasted enough times in my life setting up machines and don't want to continue.

[Dotfiles are meant to be forked,](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked) but these aren't. These scripts install many things you won't ever use. Feel free to look around and copy some of my script to fit your needs.

## Chezmoi

These dotfiles are managed with [Chezmoi](https://chezmoi.io).

## Usage

First, download and install manually the [1Password](https://1password.com/product/mac) password manager.

> 1Password version 8 is required since it features an SSH agent, which stores the GitHub SSH key.

Next, enable 1Password's SSH agent (Developer > SSH Agent > Use SSH agent).

After configuring 1Password, download and execute the [installation script](./install.sh).

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/vladucu/dotfiles/main/install.sh) -k"
```


## Manual tasks (One-time per machine)

- macOS
  - Go to Keyboard shortcuts > switch Spotlight from `CMD + Space` to `Option + Space`.
  - Log into SpiderOakOne.
  - Run `mackup restore` once SpiderOakOne syncing finished.

### TODOs

- [ ] Instructions to import GPG keys

### Installed Applications & Tools

- macOS
  - [Homebrew](https://brew.sh)
  - [Homebrew Cask](https://github.com/Homebrew/homebrew-cask)
  - [Mas](https://github.com/mas-cli/mas)
  - [Chezmoi](https://chezmoi.io)
  - [Raycast](https://www.raycast.com/) as launcher
  - [kitty](https://sw.kovidgoyal.net/kitty/) as terminal
  - [zsh](https://zsh.org) with [sheldon.cli](https://sheldon.cli.rs/) + [pure](https://github.com/sindresorhus/pure) prompt
    - using chezmoi turned out to be amazing, because zsh config can run all the expensive evaluations when applying the dotfiles, hence making the shell starting time blazing fast
  - [asdf](https://asdf-vm.com) with Ruby / Rust / Elixir
  - [volta](https://volta.sh) as Node.js tool manager
  - [tmux](https://github.com/tmux/tmux/)
  - [macOS defaults](https://mths.be/macos)

<details>
  <summary><b>Notes</b></summary>

### Apple Silicon

- Yabai : Cannot use space switch commands (eg. `yabai -m space --focus 1`) even if SIP is disabled
  <details>
    <summary>Workaround</summary>

  Setup native shortcut keys manually and use non-consuming shortcut settings (`->`) in `skhd`
  ![image](https://user-images.githubusercontent.com/248741/111079897-a77e6380-852e-11eb-92d5-42f743dc3060.png)
  </details>
</details>

### Inspirations
- [narze/dotfiles](https://github.com/narze/dotfiles)
- [twpayne/dotfiles](https://github.com/twpayne/dotfiles)