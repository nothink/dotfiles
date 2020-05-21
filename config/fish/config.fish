set -x GOPATH $HOME/.go
set -x GO111MODULE auto

set -x PATH ~/.bin $PATH
set -x LANG ja_JP.UTF-8
set -x EDITOR /usr/local/bin/nano

set GHQ_SELECTOR peco

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -g fish_user_paths $HOME/.nodebrew/current/bin $fish_user_paths
