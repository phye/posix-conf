# This file stores machine dependent configs

# locations (for location specific configs in zsh and emacs)
export LOCATION="home"

# proxy
if [ "$LOCATION" = "home" ]; then
    export http_proxy=http://127.0.0.1:8123
    export https_proxy=$http_proxy
    export no_proxy=127.0.0.1,mirrors.tencentyun.com,mirrors.tencent.com,mirrors.163.com,mirrors.tuna.tsinghua.edu.cn
fi

# utils
if [ `uname -s` = "Darwin" ]; then
    export default_bin_path=/opt/homebrew/bin
else
    export default_bin_path=/usr/local/bin
fi
export ZSH_PATH=$default_bin_path/zsh
export FZF_PATH=$default_bin_path/fzf