remember to install bash completions on mac using brew

if [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]]; then
  source "/opt/homebrew/etc/profile.d/bash_completion.sh"
fi

create bash_env for system spesifics, loaded first in bash_init

brew install bash to get bash 5

bash profile should look like 
```
eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return ;;
esac
```

and .bashrc like

```
source ~/.bash_configs/bash_init
```