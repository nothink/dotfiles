
source /usr/local/opt/asdf/asdf.fish
set -g fish_user_paths "/usr/local/opt/unzip/bin" $fish_user_paths

set -g -x CPPFLAGS "$CPPFLAGS -I/usr/local/opt/openssl/include -I/usr/local/opt/zlib/include"
set -g -x LDFLAGS "$LDFLAGS -L/usr/local/opt/openssl/lib -L/usr/local/opt/zlib/lib"

set -g -x PKG_CONFIG_PATH "$PKG_CONFIG_PATH /usr/local/opt/zlib/lib/pkgconfig"
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
