## Usage

[*chezmoi*](https://www.chezmoi.io/) is used to bootstrap dotfiles.

* One-line binary install
    ```sh
    sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply vladucu
    ```


<details>
    <summary>Notes</summary>

## Manual steps

### Multi-user support
If using multi-user support, Brew doesn't play nicely with this. Instead create
a dedicated user & group called `ops` to install brew stuff before running chezmoi.
- [ ] Automate creating this

### Import GPG keys
- use GPG Keychain provided by gpg-suite OR command-line
- mark it as ultimate

### Raycast
- Import Raycast configuration
- [ ] Remove Spotlight conflicting keyboard shortcut

### SpiderOak One Backup
- download & install manually if it fails throw `brew`

### VS Code
- open and enable _Sync Settings_ signing in with Github.

### Nix

#### Sources of inspiration
- https://ianthehenry.com/posts/how-to-learn-nix/quick-start-guide/
- https://yuanwang.ca/posts/getting-started-with-flakes.html
- https://checkoway.net/musings/nix/
- https://wiki.nikiv.dev/package-managers/nix/
- https://github.com/ahmedelgabri/dotfiles
- https://github.com/azuline/nixos
</details>
