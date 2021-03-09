#set -x GOPATH $HOME/.go
#set -x GO111MODULE auto

set -x PATH ~/.bin $PATH
set -x LANG ja_JP.UTF-8
set -x EDITOR nano
set -x NAMESPACE ug008-ishii

set GHQ_SELECTOR peco

set -x DOCKER_BUILDKIT 1
set -x COMPOSE_DOCKER_CLI_BUILD 1

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -g fish_user_paths $HOME/.nodebrew/current/bin $fish_user_paths

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
