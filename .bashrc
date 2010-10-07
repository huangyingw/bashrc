# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initializing new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cywgin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi

#alias for git
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initializing new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cygwin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

alias apf='apt-get update && aptitude full-upgrade'
alias api='apt-get install'
alias apu='apt-get update'
alias ca='$HOME/myproject/git/linux/bashrc/ca.sh'
alias cr='$HOME/myproject/git/linux/bashrc/check_raid.sh'
alias d='make && $HOME/myproject/git/linux/bashrc/debug.sh'
alias ll='ls -alF'
alias rt='$HOME/reboot.sh'
alias dof='$HOME/myproject/git/linux/bashrc/dof.sh'
alias fc='$HOME/myproject/git/linux/bashrc/fc.sh'
alias fd='$HOME/myproject/git/linux/bashrc/fd.sh'
alias ff='$HOME/myproject/git/linux/bashrc/ff.sh'
alias fr='$HOME/myproject/git/linux/bashrc/fr.sh'
alias fw='$HOME/myproject/git/linux/bashrc/fw.sh'

#alias for git
alias la='ls -A'
alias l='ls -CF'
alias r='make && ./run'
alias m='make'
alias mov='$HOME/myproject/git/linux/bashrc/move.sh'
alias qrsc='$HOME/myproject/git/linux/bashrc/qrsync.sh'
alias rsc='$HOME/myproject/git/linux/bashrc/rsync.sh'
alias trsc='$HOME/myproject/git/linux/bashrc/trsync.sh'

#alias for git
alias	g='$HOME/myproject/git/linux/bashrc/g.sh'
alias	ga='git add'
alias	gbi='git bisect'
alias	gbib='git bisect bad'
alias	gbig='git bisect good'
alias	gbir='git bisect reset'
alias	gbis='git bisect start'
alias	gbr='git branch'
alias	gbra='git branch -a'
alias	gbrc='git branch --contains'
alias	gbrD='$HOME/myproject/git/linux/bashrc/gbrD.sh'
alias	gci='git commit -am'
alias	gcb='$HOME/myproject/git/linux/bashrc/gcb.sh'
alias	gcl='$HOME/myproject/git/linux/bashrc/gcl.sh'
alias	gctb='$HOME/myproject/git/linux/bashrc/gctb.sh'
alias	gco='git checkout'
alias	gcob='git checkout -b'
alias	gch='git cherry'
alias	gchp='git cherry-pick'
alias	gdi='git diff'
alias	gfe='git fetch'
alias	gfix='$HOME/myproject/git/linux/bashrc/gfix.sh'
alias	gi='$HOME/myproject/git/linux/bashrc/gi.sh'
alias	gib='$HOME/myproject/git/linux/bashrc/gib.sh'
alias	gicb='$HOME/myproject/git/linux/bashrc/gicb.sh'
alias	glf='git ls-files'
alias	glg='git log --pretty=oneline'
alias	glga='git log --all'
alias	gme='git merge'
alias	gmet='git mergetool'
alias	gpl='git pull'
alias	gps='$HOME/myproject/git/linux/bashrc/gps.sh'
alias	grc='git rm --cached'
alias	grcr='git rm --cached -r'
alias	grs='git reset'
alias	grsh='$HOME/myproject/git/linux/bashrc/grsh.sh'
alias	grsm='git reset --mixed'
alias	grss='git reset --soft'
alias	grt='git remote'
alias	grta='git remote add'
alias	grtao='git remote rm origin || git remote add origin'
alias	grtu='git remote update'
alias	grtv='git remote -v'
alias	grv='git revert'
alias	gsh='git show'
alias	gsm='git submodule'
alias gs='git status'
alias gsta='git stash'
alias gtag='$HOME/myproject/git/linux/bashrc/gtag.sh'
alias gtg='git tag -l -n1'
alias gvd='git difftool'

$HOME/myproject/git/linux/bashrc/check_raid.sh
HERITRIX_HOME=$HOME/myproject/git/java/heritrix-1.14.4/
JAVA_OPTS=-Xmx1024M
JAVA_HOME=/usr/lib/jvm/java-6-openjdk/jre/bin/java
CLASSPATH=/media/volgrp/myproject/git/java/lucene/lucene-3.0.1/lucene-core-3.0.1.jar:/media/volgrp/myproject/git/java/lucene/lucene-3.0.1/lucene-demos-3.0.1.jar:/media/volgrp/myproject/git/webapps/luceneweb/WEB-INF/lib/lucene-core-3.0.1.jar:/media/volgrp/myproject/git/webapps/luceneweb/WEB-INF/lib/lucene-demos-3.0.1.jar
export CLASSPATH

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31'
