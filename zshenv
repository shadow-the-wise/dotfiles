#==============================================================================
# Zsh Env
#==============================================================================
# hosttype {{{1

# HOSTTYPE = { Linux | darwin | etc. }
if which uname &>/dev/null; then
  HOSTTYPE=`uname -s`
else
  HOSTTYPE=unknown
fi

export HOSTTYPE
# }}}
# path {{{1

# Validate .bin directory exists
if [[ -d "$HOME/.bin" ]]; then
    export PATH="${PATH:+${PATH}:}$HOME/.bin:/usr/local/bin"
fi


# Validate node@16 directory exists
if [[ -d "/usr/local/opt/node@16" ]]; then
    # brew installed node@16
    export PATH="${PATH:+${PATH}:}/usr/local/opt/node@16/bin"
fi

# Validate python3.10 directory exists
if [[ -d "/usr/local/opt/python@3.10" ]]; then
    # brew installed python3.10
    export PATH="${PATH:+${PATH}:}/usr/local/opt/python@3.10/bin"
fi

# Add neovim
#export PATH="${PATH:+${PATH}:}/usr/local/opt/neovim"

# }}}
# lang {{{1

export LANG='en_US.UTF-8'

# }}}
# zsh {{{1

# zsh user home directory
export ZSH=$HOME/.zsh

# }}}
# homebrew {{{1

# homebrew no emojis
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_PREFIX="/usr/local";
export HOMEBREW_CELLAR="/usr/local/Cellar";
export HOMEBREW_REPOSITORY="/usr/local/Homebrew";
export HOMEBREW_SHELLENV_PREFIX="/usr/local";
#export PATH="/usr/local/bin:/usr/local/sbin${PATH+:$PATH}";
export MANPATH="/usr/local/share/man${MANPATH+:$MANPATH}:";
#export INFOPATH="/usr/local/share/info:${INFOPATH:-}";

# }}}
# rbenv {{{1

# zshrc eval (init -) adds the shims to the path

export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export RBENV_VERSION="3.0.0"

# }}}
# nvim {{{1

# if editor is present, set default editor
if [[ -x $(which nvim 2> /dev/null) ]]; then
    export EDITOR="nvim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

# }}}
# less {{{1

# Set less options
if [[ -x $(which less 2> /dev/null) ]]; then
    export PAGER="less"

    # basic settings for formatting and to stop line chars.
    export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

    # prevent less from having a history
    export LESSHISTFILE='-'

    # less pipe is a preprocessor.
    if [[ -x $(which lesspipe 2> /dev/null) ]]; then
	LESSOPEN="| lesspipe %s"
	export LESSOPEN
    fi
fi

# }}}
# manpage {{{1

# man page piped to vim
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# }}}
# mpv home {{{1

export MPV_HOME="$HOME/.config/mpv"

# }}}
# misc {{{!

# Esc key reduced lag time
export KEYTIMEOUT=1

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

# }}}
# colors {{{1
# e - Directory
# f - Symbolic Link

# b - red
# c - lime green
# f - pink

# turn on colors
export CLICOLOR=1

# lscolors
export LSCOLORS='exfxhxDefxhxhxhxhxcxcx'

# }}}

