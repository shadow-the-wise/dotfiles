#==============================================================================
# Version:2.0
# Author: Shadow
# Last Update: Saturday, 22 May, 2021,  3:53 PM
#==============================================================================
# ZSHRC
#==============================================================================
# Setopt {{{1

# AUTO_CD (-J)
#
# If a command is issued that can’t be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
# This option is only applicable if the option SHIN_STDIN is set, i.e. if
# commands are being read from standard input. The option is designed for
# interactive use; it is recommended that cd be used explicitly in scripts to
# avoid ambiguity.
#
# autocd without the cd command
setopt autocd

# -----------------------------------------------------------------------------
# CD Path
# -----------------------------------------------------------------------------
cdpath=(~)

# -----------------------------------------------------------------------------
# Named Dirs
# -----------------------------------------------------------------------------
# hash -d nvim=$HOME/.config/nvim
# hash -d projects=$HOME/Code/Ruby/Projects
# hash -d sites=$HOME/Sites

# automatically remove duplicates from these arrays
# typeset -U path cdpath fpath manpath

# LONGLISTJOBS
#
# display PID when suspending processes as well
#
setopt longlistjobs

# RM_STAR_WAIT
#
# If querying the user before executing ‘rm *’ or ‘rm path/*’, first wait ten
# seconds and ignore anything typed in that time. This avoids the problem of
# reflexively answering ‘yes’ to the query when one didn’t really mean it. The
# wait and query can always be avoided by expanding the ‘*’ in ZLE (with tab).
#
# if you do a 'rm *', Zsh will give you a sanity check!
setopt rm_star_wait

# EXTENDED_GLOB
#
# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename
# generation, etc. (An initial unquoted ‘~’ always produces named directory
# expansion.)
#
# complex pattern globbing
setopt extendedglob

# CDABLE_VARS (-T)
#
# If the argument to a cd command (or an implied cd with the AUTO_CD option set)
# is not a directory, and does not begin with a slash, try to expand the expression
# as if it were preceded by a ‘~’
#
setopt cdable_vars

# AUTO_NAME_DIRS
#
# Any parameter that is set to the absolute name of a directory immediately
# becomes a name for that directory, that will be used by the ‘%~’ and related
# prompt sequences, and will be available when completion is performed on a
# word starting with ‘~’. (Otherwise, the parameter must be used in the form
# ‘~param’ first.)
#
setopt auto_name_dirs

# CLOBBER (+C, ksh: +C) <D>
#
# Allows ‘>’ redirection to truncate existing files. Otherwise ‘>!’ or ‘>|’
# must be used to truncate a file.
#
# If the option is not set, and the option APPEND_CREATE is also not set, ‘>>!’
# or ‘>>|’ must be used to create a file. If either option is set, ‘>>’ may be
# used.
#
# make piping to files works normaly
setopt clobber

# LISTTYPES
#
# This causes the menu completion display to include characters indicating the
# types of the items (symbolic links, executables, etc.)
#
setopt listtypes

# AUTO_LIST (-9) <D>
#
# Automatically list choices on an ambiguous completion.
#
setopt auto_list

# COMPLETE_ALIASES
#
# Prevents aliases on the command line from being internally substituted before
# completion is attempted. The effect is to make the alias a distinct command
# for completion purposes.
#
setopt COMPLETE_ALIASES

# HUP <Z>
#
# Send the HUP signal to running jobs when the shell exits.
#
# do not kill running jobs when shell exits
unsetopt hup

# history replay
zle -N hist_replay

#}}}
# Unsetopt {{{1

# Zsh has a spelling corrector
unsetopt CORRECT
unsetopt CORRECTALL

#}}}
# Prompt {{{1
# Root {{{2
#------------------------------------------------------------------------------
if [ "$USER" = "root" ]; then
    prompt_user="%F{red}%n%f"
else
    prompt_user="%F{white}%n%f"
fi;

# }}}
# Prompt color variables {{{2
#------------------------------------------------------------------------------
unicode_char="❯"
div=""
pre_upper="╭─"
pre_lower="╰─"
prompt_apple="%K{blue} %F{white}%f %k"
prompt_date="%F{blue}%D{%A, %d %b}%f"
prompt_time="%F{white}%D{%l:%M %p}%f"
prompt_jobs="[%F{green}%j%f]"
prompt_at="%F{blue}@%f"
prompt_machine="%F{blue}%m%f"
prompt_symbol="%F{white}${unicode_char}${unicode_char}%f"
prompt_exit_code=" %(?.%F{blue}.%F{red})❯%f"

# }}}
# Git Prompt {{{2
#-------------------------------------------------------------------------------

# git branch to check if there is a git repo in the directory, use sed to find
# the branch.

function parse_git_branch() {
    OUTPUT=$(git branch 2> /dev/null)
  if [[ $? -eq 0 ]]; then
    local EXIT_CODE_PROMPT=''
    EXIT_CODE_PROMPT+="%K{cyan}%F%(5~|%-1~/…/%3~|%4~)%k%K%F{cyan}${div}%f%k"
    EXIT_CODE_PROMPT+="%K git:("
    EXIT_CODE_PROMPT+="%F{green}$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')%f"
    EXIT_CODE_PROMPT+=")%k%K{black}%F${div}%f%k"
    echo "$EXIT_CODE_PROMPT"
  else
    local NO_GIT=''
    NO_GIT+="%K{cyan}%F%(5~|%-1~/…/%3~|%4~)"
    NO_GIT+="%K%F{cyan}${div}%f%k"
    echo "$NO_GIT"
  fi
}

setopt PROMPT_SUBST

# }}}
# Git commits {{{2
#-------------------------------------------------------------------------------
function ahead_behind {
    # get the curretn branch
    branch="$(git branch 2> /dev/null| grep "\*" | awk '{print $2}')"

    # find if your current feature branch is behind remote master
    ahead="$(git rev-list --left-right --count origin/$branch...@ 2> /dev/null | awk '{print $2}')"
    behind="$(git rev-list --left-right --count origin/$branch...@ 2> /dev/null | awk '{print $1}')"

    local COMMITED=''

    if [[ $ahead > 0 ]]; then
        COMMITED+="%K%F{blue}+%f%k%K%F{green}${ahead} %f%k"
    fi

    if [[ $behind > 0 ]]; then
        COMMITED+="%K%F{red}-%f%k%K%F{blue}${behind}%f%k"
    fi

    echo "$COMMITED"
}

# }}}
# basic layout {{{2
# ------------------------------------------------------------------------------
# apple logo and date
# time
# jobs
# user, @, machine
basic="${prompt_apple}%K{white} ${prompt_date}%k%K{blue}%F{white}${div}%f%k\
%K{blue}%F{white}${prompt_time}%f%k%K{black}%F{blue}${div}%f%k\
%K{black}${prompt_jobs}%k\
%K ${prompt_user}${prompt_at}${prompt_machine}%k%K{cyan}%F${div}%f%k"
# }}}
# PS1 {{{2
#------------------------------------------------------------------------------
# define a function that sets PS1, then add that function to the
# precmd_functions array so that it is executed prior to displaying each
# prompt.
prompt () {
export PS1="
${pre_upper}${basic}$(parse_git_branch)${commits}$(ahead_behind)
${pre_lower}${prompt_exit_code}${prompt_symbol}"
}
precmd_functions+=(prompt)

#}}}
# }}}
# Set Title {{{1

# When directory is changed set xterm title to host:dir
chpwd() {
	[[ -t 1 ]] || return
	case $TERM in
	sun-cmd) print -Pn "\e]l%~\e\\";;
		*xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%m:%~\a";;
	esac
}

# }}}
# History {{{1
#------------------------------------------------------------------------------
# History
#------------------------------------------------------------------------------
HISTSIZE=50000
SAVEHIST=50000
HIST_STAMPS="dd/mm/yyyy"
HISTFILE="$HOME/.cache/zsh/zsh_history.txt"
HISTORY_IGNORE="(pwd|less *|l[alsh]#( *)#|[bf]g *|exit|reset|clear)"

# APPEND_HISTORY <D>
#
# If this is set, zsh sessions will append their history list to the history
# file, rather than replace it. Thus, multiple parallel zsh sessions will all
# have the new entries from their history lists added to the history file, in
# the order that they exit. The file will still be periodically re-written to
# trim it when the number of lines grows 20% beyond the value specified by
# $SAVEHIST.
#
# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY

# SHARE_HISTORY <K>
#
# This option both imports new commands from the history file, and also causes
# your typed commands to be appended to the history file (the latter is like
# specifying INC_APPEND_HISTORY, which should be turned off if this option is
# in effect). The history lines are also output with timestamps ala
# EXTENDED_HISTORY (which makes it easier to find the spot where we left off
# reading the file after it gets re-written).

# By default, history movement commands visit the imported lines as well as the
# local lines, but you can toggle this on and off with the set-local-history
# zle binding. It is also possible to create a zle widget that will make some
# commands ignore imported commands, and some include them.

# If you find that you want more control over when commands get imported, you
# may wish to turn SHARE_HISTORY off, INC_APPEND_HISTORY or
# INC_APPEND_HISTORY_TIME (see above) on, and then manually import
#
# Imports new commands and appends typed commands to history
setopt SHARE_HISTORY

# EXTENDED_HISTORY <C>
#
# Save each command’s beginning timestamp (in seconds since the epoch) and the
# duration (in seconds) to the history file. The format of this prefixed data
# is:
#
# ‘: <beginning time>:<elapsed seconds>;<command>’.
#
# Save timestamp of command and duration
setopt EXTENDED_HISTORY

# INC_APPEND_HISTORY
#
# This option works like APPEND_HISTORY except that new history lines are added
# to the $HISTFILE incrementally (as soon as they are entered), rather than
# waiting until the shell exits. The file will still be periodically re-written
# to trim it when the number of lines grows 20% beyond the value specified by
# $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
#
# Add comamnds as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY


# BANG_HIST (+K) <C> <Z>
#
# Perform textual history expansion, csh-style, treating the character ‘!’
# specially.
#
setopt BANG_HIST

# HIST_IGNORE_ALL_DUPS
#
# If a new command line being added to the history list duplicates an older
# one, the older command is removed from the list (even if it is not the
# previous event).
#
setopt HIST_IGNORE_ALL_DUPS

# HIST_EXPIRE_DUPS_FIRST
#
# If the internal history needs to be trimmed to add the current command line,
# setting this option will cause the oldest history event that has a duplicate
# to be lost before losing a unique event from the list. You should be sure to
# set the value of HISTSIZE to a larger number than SAVEHIST in order to give
# you some room for the duplicated events, otherwise this option will behave
# just like HIST_IGNORE_ALL_DUPS once the history fills up with unique events.
#
# This will cause the oldest history duplicate to be lost
setopt HIST_EXPIRE_DUPS_FIRST

# HIST_FIND_NO_DUPS
#
# When searching for history entries in the line editor, do not display
# duplicates of a line previously found, even if the duplicates are not
# contiguous.
#
# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# HIST_IGNORE_SPACE (-g)
#
# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading
# space. Only normal aliases (not global or suffix aliases) have this
# behaviour. Note that the command lingers in the internal history until the
# next command is entered before it vanishes, allowing you to briefly reuse or
# edit the line. If you want to make it vanish right away without entering
# another command, type a space and press return.
#
# Remove from history list when first character on the line is a space
setopt HIST_IGNORE_SPACE

# HIST_REDUCE_BLANKS
#
# Remove superfluous blanks from each command line being added to the history
# list.
#
setopt HIST_REDUCE_BLANKS

# Don't execute, just expand history: append :p to print the command without running it
# setopt HIST_VERIFY

#}}}
# Dir Stack {{{1
autoload -Uz add-zsh-hook

# DIRSTACKFILE
#
# configure the dirstack file location
#
DIRSTACKFILE="$HOME/.cache/zsh/recent_dirs.txt"

# Eval if the DIRSTACKFILE exists and add the new dir change to it
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
	dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
	[[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
fi
chpwd_dirstack() {
	print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}

# zsh builtins
#
# use zsh builtin chpwd (change present working directory) and on dir change
# call the function chpwd_dirstack()
#
add-zsh-hook -Uz chpwd chpwd_dirstack

DIRSTACKSIZE='50'

# AUTO_PUSHD
#
# push cd dirs to the dir stack automatically
#
# PUSHD_SILENT
#
# do not print the pushed dirs to the screen
#
# PUSHD_TO_HOME
#
setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

# PUSHD_IGNORE_DUPS
#
# Remove duplicate entries
#
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
#setopt PUSHD_MINUS

#}}}
# Functions {{{1

# fpath
#
# autoload
#
# The 4.2.6/functions directory contains functions shipped with zsh 4.2.6. The
# site-functions directory contains functions that are added by third-party
# packages or by the local administrator; under Linux the local administrator
# would usually use a site-functions directory under /usr/local
#
# autoload USER defined functioned directory and files and add them to the fpath
# (functions path)
#
# autoload tells zsh to look for a file in $FPATH/$fpath containing a function
# definition, instead of a file in $PATH/$path containing an executable script
# or binary.
#
# This means that when a function is autoloaded, the corresponding file is
# merely executed, and must define the function itself.
#
# functions autoload and add to functions path
autoload -U $HOME/.zsh/functions/*(:t)
fpath=($ZSH/functions/ $fpath)

#}}}
# completion {{{1
zstyle ':autocomplete:*' default-context ''
# '': Start each new command line with normal autocompletion.
# history-incremental-search-backward: Start in live history search mode.

zstyle ':autocomplete:*' min-delay 0.0  # number of seconds (float)
# 0.0: Start autocompletion immediately when you stop typing.
# 0.4: Wait 0.4 seconds for more keyboard input before showing completions.

zstyle ':autocomplete:*' min-input 1  # number of characters (integer)
# 0: Show completions immediately on each new command line.
# 1: Wait for at least 1 character of input.

zstyle ':autocomplete:*' ignored-input '' # extended glob pattern
# '':     Always show completions.
# '..##': Don't show completions when the input consists of two or more dots.

# When completions don't fit on screen, show up to this many lines:
zstyle ':autocomplete:*' list-lines 16  # (integer)
# NOTE: The actual amount shown can be less.

# If any of the following are shown at the same time, list them in this order:
zstyle ':completion:*:' group-order \
    expansions history-words options \
    aliases functions builtins reserved-words \
    executables local-directories directories suffix-aliases
# NOTE: This is NOT the order in which they are generated.

zstyle ':autocomplete:*' insert-unambiguous no
# no:  Tab inserts the top completion.
# yes: Tab first inserts substring common to all listed completions, if any.

zstyle ':autocomplete:*' widget-style complete-word
# complete-word: (Shift-)Tab inserts the top (bottom) completion.
# menu-complete: Press again to cycle to next (previous) completion.
# menu-select:   Same as `menu-complete`, but updates selection in menu.
# NOTE: This can NOT be changed at runtime.

zstyle ':autocomplete:*' fzf-completion no
# no:  Tab uses Zsh's completion system only.
# yes: Tab first tries Fzf's completion, then falls back to Zsh's.
# NOTE: This can NOT be changed at runtime and requires that you have
# installed Fzf's shell extensions.

# Add a space after these completions:
zstyle ':autocomplete:*' add-space \
    executables aliases functions builtins reserved-words commands

# source ~/.zsh/lib/zsh-autocomplete/zsh-autocomplete.plugin.zsh

bindkey $key[Up] up-line-or-search
# up-line-or-search:  Open history menu.
# up-line-or-history: Cycle to previous history line.

# bindkey $key[Down] down-line-or-select
# down-line-or-select:  Open completion menu.
# down-line-or-history: Cycle to next history line.

# bindkey $key[Control-Space] list-expand
# list-expand:      Reveal hidden completions.
# set-mark-command: Activate text selection.

# bindkey -M menuselect $key[Return] .accept-line
# .accept-line: Accept command line.
# accept-line:  Accept selection and exit menu.

# Uncomment the following lines to disable live history search:
# zle -A {.,}history-incremental-search-forward
# zle -A {.,}history-incremental-search-backward

# }}}
# Switch Term {{{1

# switch between term and vim (start v first)
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

# }}}
# rbenv {{{1

#
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Set up rbenv in your shell
eval "$(rbenv init -)"

#}}}
# zsh autosuggestions {{{1

# brew installed zsh autosugestion
if [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Will first try to find a suggestion from your history, but, if it can't find
# a match, will find a suggestion from the completion engine.
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4b4b4b'

# }}}
# Source {{{1
#-------------------------------------------------------------------------------

# brew installed zsh highlighting
if [[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# source aliases
source $HOME/.zsh_aliases

# }}}
