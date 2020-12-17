
source /usr/local/opt/asdf/asdf.fish
set -g fish_user_paths "/usr/local/opt/unzip/bin" $fish_user_paths
set -g -x CPPFLAGS "$CPPFLAGS -I /usr/local/opt/openssl/include"
set -g -x LDFLAGS "$LDFLAGS -L /usr/local/opt/openssl/lib"
