source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
autoload -Uz promptinit
promptinit
prompt powerline
source "/home/tuelz/.zprezto/modules/git/init.zsh"
source "/home/tuelz/.zprezto/modules/git/alias.zsh"
source "/home/tuelz/.zprezto/modules/tmux/init.zsh"
source "/home/tuelz/.zprezto/modules/ssh/init.zsh"
zstyle ':prezto:module:ssh:load' identities 'github' 'bitbucket' '~/.ssh/bit_work'

export PATH="$PATH:/home/tuelz/scripts"
export ERL_AFLAGS="-kernel shell_history enabled"
alias srm="sudo srm -flrv"
alias pclean="mix deps.clean 'texas' && mix deps.get && pserv"
alias pserv='export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && iex -S mix phx.server'
alias serverless="$HOME/node_modules/serverless/bin/serverless"

#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/tuelz/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/tuelz/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/tuelz/node_modules/tabtab/.completions/sls.zsh ]] && . /home/tuelz/node_modules/tabtab/.completions/sls.zsh
