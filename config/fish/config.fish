set -x PATH ~/.bin $PATH
set -x LANG ja_JP.UTF-8
set -x EDITOR nano

# aliases
alias ls="ls -FG"

set -x DOCKER_BUILDKIT 1
set -x COMPOSE_DOCKER_CLI_BUILD 1


set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
