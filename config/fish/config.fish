fish_add_path $HOME/.bin

set -x LANG ja_JP.UTF-8
set -x EDITOR nano
set -x PAGER bat

# aliases (every using)
alias ls="ls -FG"

# TODO: use abbr fro utils
# https://qiita.com/wataash/items/ab0a8b86b60e782f537f

set -x DOCKER_BUILDKIT 1
set -x COMPOSE_DOCKER_CLI_BUILD 1

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
