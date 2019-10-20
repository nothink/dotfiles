export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

autoload -U promptinit; promptinit
prompt pure

setopt auto_cd

zplug "yous/vanilli.sh"

# plugins
zplug 'zsh-users/zsh-apple-touchbar'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug "zsh-users/zsh-history-substring-search"
zplug 'zsh-users/zsh-syntax-highlighting'
zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "supercrabtree/k"

zplug "asdf-vm/asdf"
source $ZPLUG_REPOS/asdf-vm/asdf/asdf.sh
source $ZPLUG_REPOS/asdf-vm/asdf/completions/asdf.bash

# install or load
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi
zplug load # --verbose
