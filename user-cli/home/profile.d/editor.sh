
# Prefer neovim, accept vim
if hash nvim 2>/dev/null; then
    neo="n"
fi

export EDITOR=${neo}'vim'
export VISUAL=${neo}'vim'
export PAGER='less'
export BROWSER='firefox'

