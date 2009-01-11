# .zshrc is sourced in interactive shells.  It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#

# read bash and zsh common setting
if [ -f $HOME/.shrc ]; then
  source $HOME/.shrc
fi

# Search path for the cd command
#cdpath=(.. ~ ~/src ~/zsh)

# Use hard limits, except for a smaller stack and no core dumps
unlimit
limit stack 8192
limit core 0
limit -s

umask 022

# Set up aliases
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir

# List only directories and symbolic
# links that point to directories
alias lsd='ls -ld *(-/DN)'

# Shell functions
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }

# Where to look for autoloaded function definitions
fpath=($fpath ~/.zfunc)

# Autoload all shell functions from all directories in $fpath (following
# symlinks) that have the executable bit on (the executable bit is not
# necessary, but gives you an easy way to stop the autoloading of a
# particular shell function). $fpath should not be empty for this to work.
for func in $^fpath/*(N-.x:t); autoload $func

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

# Global aliases -- These do not have to be
# at the beginning of the command line.
alias -g L='|lv'
alias -g H='|head'
alias -g T='|tail'
alias -g G='|grep'

# Hosts to use for completion (see later zstyle)
hosts=(`hostname` ftp.math.gatech.edu prep.ai.mit.edu wuarchive.wustl.edu)

# Set prompts
#PROMPT='%m%# '    # default prompt
#RPROMPT=' %~'     # prompt for right side of screen

LPROMPT="%n@%m%% "
autoload -U colors
colors
PROMPT="%{$fg[green]%}$LPROMPT%{$reset_color%}"
precmd () {
  PROMPT="%{%(?.$fg[green].$fg[red])%}$LPROMPT%{$reset_color%}"
}

RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? "

WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>/'

# Some environment variables
export HELPDIR=/usr/local/lib/zsh/help  # directory for run-help function to find docs

MAILCHECK=300
DIRSTACKSIZE=20

# Watch for my friends
#watch=( $(<~/.friends) )       # watch for people in .friends file
watch=(notme)                   # watch for everybody but me
LOGCHECK=300                    # check every 5 min for login/logout activity
WATCHFMT='%n %a %l from %m at %t.'

# Set/unset  shell options
# default
#setopt aliases
#setopt always_last_prompt
#setopt append_history
#setopt auto_list
#setopt auto_menu
#setopt auto_param_keys
#setopt auto_param_slash
#setopt auto_remove_slash
#setopt beep
#setopt case_glob
#setopt clobber
#setopt exec
#setopt flow_control
#setopt glob
#setopt global_rcs
#setopt hash_cmds
#setopt hash_dirs
#setopt hash_list_all
#setopt hist_beep
#setopt list_ambiguous
#setopt list_beep
#setopt list_types
#setopt prompt_cr
#setopt rcs

# zsh default
#setopt bad_pattern
#setopt bang_hist
#setopt bare_glob_qual
#setopt bg_nice
#setopt check_jobs
#setopt equals
#setopt function_argzero
#setopt global_export
#setopt hup
#setopt multios
#setopt nomatch
#setopt notify
#setopt prompt_percent
#setopt short_loops
#setopt unset

#setopt auto_name_dirs
setopt auto_pushd
setopt autoresume
setopt brace_ccl
#setopt chase_dots
#setopt chase_links
setopt complete_aliases
setopt complete_in_word
setopt emacs
setopt extended_glob
setopt extended_history
#setopt glob_assign
#setopt glob_complete
#setopt globdots
setopt hist_ignore_dups
#setopt hist_ignore_space
setopt hist_reduce_blanks
#setopt hist_verify
setopt interactive_comments
setopt longlistjobs
setopt magic_equal_subst
setopt mailwarning
setopt notify
setopt numeric_glob_sort
#setopt print_eight_bit
#setopt print_exit_value
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent
setopt pushd_to_home
setopt rc_quotes
setopt rec_exact
setopt share_history
#setopt transient_rprompt

unsetopt auto_cd
unsetopt cdable_vars
unsetopt clobber
unsetopt correct
unsetopt correctall
unsetopt flow_control
unsetopt list_beep
unsetopt longlistjobs
unsetopt recexact
unsetopt rm_star_silent

[[ $EMACS = t ]] && unsetopt zle


# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile


# Some nice key bindings
#bindkey '^X^Z' universal-argument ' ' magic-space
#bindkey '^X^A' vi-find-prev-char-skip
#bindkey '^Xa' _expand_alias
#bindkey '^Z' accept-and-hold
#bindkey -s '\M-/' \\\\
#bindkey -s '\M-=' \|

# bindkey -v               # vi key bindings

bindkey -e                 # emacs key bindings
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand


# Setup new style completion system. To see examples of the old style (compctl
# based) programmable completion, check Misc/compctl-examples in the zsh
# distribution.
autoload -U compinit
compinit

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'


## screen setting
# ssh
function ssh_screen() {
  eval server=\${$#}
    screen -t $server ssh "$@"
}
if [ x$TERM = x$TERMSCREEN ]; then
  alias ssh=ssh_screen
fi

# for screen status line
if [ "$TERM" = $TERMSCREEN ]; then
  chpwd () { echo -n "_`dirs`\\" }
  preexec() {
    # see [zsh-workers:13180]
    # http://www.zsh.org/mla/workers/2000/msg03993.html
    emulate -L zsh
    local -a cmd; cmd=(${(z)2})
    case $cmd[1] in
      fg)
      if (( $#cmd == 1 )); then
        cmd=(builtin jobs -l %+)
      else
        cmd=(builtin jobs -l $cmd[2])
      fi
      ;;
      %*)
      cmd=(builtin jobs -l $cmd[1])
      ;;
      cd)
      if (( $#cmd == 2)); then
        cmd[1]=$cmd[2]
      fi
      ;;
      *)
      echo -n "k$cmd[1]:t\\"
      prev=$cmd[1]
      return
      ;;
    esac

    local -A jt; jt=(${(kv)jobtexts})

    $cmd >>(read num rest
    cmd=(${(z)${(e):-\$jt$num}})
    echo -n "k$cmd[1]:t\\") 2>/dev/null

    prev=$cmd[1]
  }
  precmd() {
    #local prev; prev=`history -1 | sed "s/^[ 0-9]*//" | sed "s/ .*$//"`
    echo -n "k$:$prev\\"
  }
  chpwd
fi

# dabbrev (http://d.hatena.ne.jp/secondlife/20060108/1136650653)
HARDCOPYFILE=$HOME/tmp/screen-hardcopy
touch $HARDCOPYFILE

dabbrev-complete () {
  local reply lines=80 # 80行分
  screen -X eval "hardcopy -h $HARDCOPYFILE"
  reply=($(sed '/^$/d' $HARDCOPYFILE | sed '$ d' | tail -$lines))
  compadd - "${reply[@]%[*/=@|]}"
}

zle -C dabbrev-complete menu-complete dabbrev-complete
bindkey '^o' dabbrev-complete
bindkey '^o^_' reverse-menu-complete

# cdd (http://d.hatena.ne.jp/secondlife/20080218/1203303528)
autoload -U compinit
compinit
source $HOME/bin/cdd

function chpwd() {
  _reg_pwd_screennum
}
