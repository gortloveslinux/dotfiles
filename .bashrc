# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# get ma aliases
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# custom helper functions and environment variables
[[ -f ~/.bash_functions ]] && source ~/.bash_functions

[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

PATH=~/bin:$PATH
