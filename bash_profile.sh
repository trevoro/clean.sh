#--- Globals & Config

paths=( /usr/local/go/bin )

#--- Helpers & Functions

_print_welcome() {
  uptime
  echo "OS: $(uname -s)"
}

_rbenv_setup() {
  eval "$(rbenv init -)"
}

_push_path() {
  export PATh=$PATH:"${1}"
}

_git_branch() {
  #branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
	branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d')
	if [ "${branch}" == "* master" ] ; then
		echo "+"
	elif [ "${branch}" ] ; then
		echo "*"
	else
		echo " "
  fi	
}

#--- Colors 

WHITE="\[\033[1;37m\]"
GRAY="\[\033[0;37m\]"
BRIGHTGREEN="\[\033[1;32m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
GRAY="\[\033[0;37m\]"
RED="\[\033[0;31m\]"
RESET="\[\033[00m\]"
BGRAY="\[\033[01;36m\]"


#--- Prompts

_standard_prompt() {
  PS1="\[[\033[01;36m\]\u\033[0;37m@\[\033[01;36m\]\h\[\033[00m\]:\W]\$ "
}

_git_prompt() {
	PS1="${GREEN}\h${BGRAY}:\W${WHITE}\$(_git_branch)\$ ${RESET}"
}

_tranquil_thoughts_prompt() {
  PS1="${WHITE}.oO(${GREEN}\u${BRIGHTGREEN}@${GREEN}\h ${CYAN}\w${WHITE})${GRAY} "
}

_cyan_red_prompt() {
  PS1="${CYAN}[\u@\h ${RED}\w${CYAN}]${GRAY} "
}

_shadowfax_prompt() {
  PS1="${WHITE}(${GRAY}\u${WHITE}@${GRAY}\h ${GRAY}\w${WHITE})${GRAY} "
}

_simple_time_prompt() {
  PS1="${RED}\u${WHITE}@${GRAY}\h \t \n${WHITE}(\w)\$ ${GRAY}"
}

_verbose_prompt() {
  PS1="[\!] \[\033[1;31m\]\u\[\033[0m\] \t [ \[\033[1;36m\]\h\[\033[0m\]:\[\033[1;33m\]\w\[\033[0m\] ] \n# "
}

#--- Main
for path in "${paths[@]}" ; do
  [[ -d $path ]] && _push_path '/usr/local/go/bin'
done

if [ "$PS1" ]; then
  export HISTCONTROL=ignoredups
  _git_prompt
  _print_welcome
fi

[[ -f $HOME/.bash_local ]] && . $HOME/.bash_local
