if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

ENABLE_CORRECTION="true"

plugins=(git docker docker-compose pj)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='mvim'
fi

source path/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/path/.fnm:$PATH"
eval "`fnm env`"

export PNPM_HOME="/path/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

[ -s "/path/_bun" ] && source "/path/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

PROJECT_PATHS=(paths)

alias vmd="nvim"
alias vm="nvim ."

alias zshrc="nvim ~/.zshrc"

alias lg="lazygit"

alias sshc="ssh -i ~/.ssh"

alias pm="pnpm"
alias pmu="pnpm up"
alias pmi="pnpm i"
alias pma="pnpm add"
alias pmb="pnpm run build"
alias pmd="pnpm run dev"
alias pms="pnpm start"
alias pmr="pnpm store prune"
alias pmx="pnpm exec"
alias pmdx="pnpm dlx"
alias pmv="curl -fsSL https://get.pnpm.io/install.sh | sh -s"

alias buna="bun add"
alias buni="bun install"
alias bunr="bun remove"
alias bunr="bun run"
alias bund="bun run dev"
alias bunb="bun run build"
alias buns="bun run start"
alias bunv="curl -fsSL https://bun.sh/install | bash"
