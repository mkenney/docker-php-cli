# ~/.bash_profile

export TERM=xterm

# Aliases
if [ -f ~/.bash/color ]; then
	. ~/.bash/color
fi

# Aliases
if [ -f ~/.bash/aliases ]; then
	. ~/.bash/aliases
fi

# Bash completion settings
if [ -f ~/.bash/completion ]; then
	. ~/.bash/completion
fi

# Prompt
if [ -f ~/.bash/prompt ]; then
	. ~/.bash/prompt
fi
