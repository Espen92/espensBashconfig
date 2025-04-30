remember to install bash completions on mac using brew

if [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]]; then
  source "/opt/homebrew/etc/profile.d/bash_completion.sh"
fi

create bash_env for system spesifics, loaded first in bash_init