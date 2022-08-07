if status is-interactive
    # Commands to run in interactive sessions can go here

    fish_add_path $HOME/.bin
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.local/bin

    set -x LANG ja_JP.UTF-8
    set -x LANGUAGE ja_JP.UTF-8
    set -x LC_ALL ja_JP.UTF-8

    set -x SHELL (which fish)
    set -x EDITOR nano
    set -x PAGER bat
    set -x GPG_TTY (tty)

    # aliases (every using)
    alias ls="ls -FG --color=auto"

    # TODO: use abbr fro utils
    # https://qiita.com/wataash/items/ab0a8b86b60e782f537f

    set -x DOCKER_BUILDKIT 1
    set -x COMPOSE_DOCKER_CLI_BUILD 1

    switch (uname)
    case Darwin
        # Homebrew path
        eval (/opt/homebrew/bin/brew shellenv)
        if test -d /usr/local/Caskroom/google-cloud-sdk/
            source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
        end

        if test -d (brew --prefix)"/share/fish/completions"
            set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
        end

        if test -d (brew --prefix)"/share/fish/vendor_completions.d"
            set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
        end

        if test -f (brew --prefix asdf)"/libexec/asdf.fish"
            source (brew --prefix asdf)/libexec/asdf.fish
        end
    case Linux
        if test -f $HOME/.asdf/asdf.fish
            source $HOME/.asdf/asdf.fish
        end
    end

    # Add SSH Key for ssh-agent
    if test -f $HOME/.ssh/id_ed25519
        ssh-add $HOME/.ssh/id_ed25519
    end
end
