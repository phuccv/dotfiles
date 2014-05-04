# Basic directory operations
alias ...='cd ../..'
alias ibus='ibus-daemon -drx'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi

# List direcory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias sl=ls # often screw this up

alias startx='x'
alias xinit="x"

function x(){
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 && -z $X_STARTED ]] && exec /bin/startx
}
#
# ~/.bashrc
#
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

## Modified commands ## {{{
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias dmesg='dmesg -HL'
# }}}

## New commands ## {{{
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias ..='cd ..'
# }}}

# Privileged access
if [ $UID -ne 0 ]; then
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias update='sudo pacman -Su'
    alias netctl='sudo netctl'
fi

## ls ## {{{
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
# }}}

## Safety features ## {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)
# }}}

## Pacman aliases ## {{{
#if necessary, replace 'pacman' with your favorite AUR helper and adapt the commands accordingly
alias pac="sudo /usr/bin/pacman -S"		# default action	- install one or more packages
alias pacu="sudo /usr/bin/pacman -Syu"		# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rs"		# '[r]emove'		- uninstall one or more packages
alias pacs="/usr/bin/pacman -Ss"		# '[s]earch'		- search for a package using one or more keywords
alias paci="/usr/bin/pacman -Si"		# '[i]nfo'		- show information about a package
alias paclo="/usr/bin/pacman -Qdt"		# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Scc"		# '[c]lean cache'	- delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"		# '[l]ist [f]iles'	- list all files installed by a given package
alias pacexpl="/usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed 
alias pacimpl="/usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/pacman -Qtdq > /dev/null && sudo /usr/bin/pacman -Rs \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

alias xf='xset dpms force off'
