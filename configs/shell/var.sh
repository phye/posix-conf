# This file stores machine dependent configs

# locations (for location specific configs in zsh and emacs)
export LOCATION="office"

# proxy
if [ "$LOCATION" = "home" ]; then
    export http_proxy=http://127.0.0.1:8123
    export https_proxy=$http_proxy
    export no_proxy=127.0.0.1,mirrors.tencentyun.com,mirrors.tencent.com,mirrors.163.com,mirrors.tuna.tsinghua.edu.cn
else
    unset http_proxy
    unset https_proxy
    unset no_proxy
fi

# utils
if [ `uname -s` = "Darwin" ]; then
    export default_bin_path=/opt/homebrew/bin
elif [ -f "/etc/arch-release" ]; then
    # for arch we can always rely on pacman
    export default_bin_path=/usr/bin
else
    export default_bin_path=/usr/local/bin
fi
export ZSH_PATH=$default_bin_path/zsh
export FZF_PATH=$default_bin_path/fzf