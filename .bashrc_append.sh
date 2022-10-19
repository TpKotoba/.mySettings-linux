## TpKotoba's bashrc

export PS1='\[\e[1;33m\]\u@\h\[\e[36m\]:\w \[\e[35m\][\t \d] \[\e[00m\]\n\[\e[1;37m\]In [\#]\[\e[1;37m\]\$ \[\e[00m\]'


# ls aliases
alias l='ls --almost-all --classify -l --sort=extension'
alias la='ls -L --almost-all'
alias lx='ls -L --sort=extension'
alias lt='ls -L --sort=time'
alias lz='ls -L --sort=size'

notdir_err(){
	echo "'$1' is not a valid directory."
}
notfile_err(){
	echo "'$1' is not a valid file."
}

lless(){
	if [ -d $1 ] || [ $1 == '' ]; then
		l $1 | less
	else
		notdir_err $1
	fi
}
lmore(){
	if [ -d $1 ] || [ $1 == '' ]; then
		l $1 | more
	else
		notdir_err $1
	fi
}


# directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ..0='cd ~/'
alias ..d='cd ~/Desktop/'

alias cls='clear'
alias md='mkdir'
alias py='python3'
alias cll='clear; lless'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi


# extract archives
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.xz)    tar Jxvf $1    ;;
			*.tar.bz2)   tar jxvf $1    ;;
			*.tar.gz)    tar zxvf $1    ;;
			*.xz)        xz -d $1       ;;
			*.bz2)       bunzip2 $1     ;;
			*.gz)        gunzip $1      ;;
			*.txz)       tar Jxvf $1    ;;
			*.tbz2)      tar jxvf $1    ;;
			*.tgz)       tar zxvf $1    ;;
			*.rar)       unrar x $1     ;;
			*.tar)       tar xvf $1     ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)           echo "don't know how to extract '$1'..." ;;
		esac
	else
		notfile_error $1
	fi
}