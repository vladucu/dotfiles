#!/bin/sh

# https://www.chezmoi.io/user-guide/advanced/install-your-password-manager-on-init/

case "$(uname -s)" in
Darwin)
    [ -x "/Applications/1Password.app/Contents/MacOS/1Password" ] && exit

    curl -L https://downloads.1password.com/mac/1Password.zip -o /tmp/1password.zip
    unzip /tmp/1password.zip -d /tmp/1password
    open /tmp/1password/1Password\ Installer.app/

    # Wait for user input to continue
    echo "Press any key to continue..."
    read -n 1 -s
    ;;
Linux)
    # commands to install password-manager-binary on Linux
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
