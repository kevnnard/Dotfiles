if status is-interactive
    # Commands to run in interactive sessions can go here
    # eval (zellij setup --generate-auto-start fish | string collect)
end

set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
set -U fish_user_paths /usr/local/bin $fish_user_paths

# PJ 
set -gx PROJECT_PATHS ~/Documents/THREE/ ~/Documents/OCMI/ ~/Documents/KEVNNARD/ ~/Documents/KEVNNARD/GRUPOR/

# Alliases for Fish shell
abbr --add fh nvim ~/.config/fish/config.fish
abbr --add c clear
abbr --add e exit
abbr --add l ls
abbr --add ll "ls -l"

# Aliases for git
abbr --add lg lazygit

# Alliases for Docker
abbr --add ldd lazydocker

# Alliases for nvim
abbr --add vmd nvim
abbr --add vm nvim .

# Alliases for zellij
abbr --add z zellij
abbr --add zj zellij --layout .config/zellij/layouts/janus.yml
abbr --add ztr zellij --layout .config/zellij/layouts/three.yml

# Alliases for pnpm
abbr --add pm pnpm
abbr --add pmi pnpm install
abbr --add pma pnpm add
abbr --add pmd pnpm run dev
abbr --add pmt pnpm run test
abbr --add pmb pnpm run build
abbr --add pmr pnpm store prune
abbr --add pmu pnpm update
abbr --add pmx pnpm exec
abbr --add pmg pnpm run generate
abbr --add pms pnpm run start
abbr --add pmv "curl -fsSL https://get.pnpm.io/install.sh | sh -s"

# pnpm
set -gx PNPM_HOME /Users/kevnnard/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Podaman
abbr --add pod podman
abbr --add podb podman build
abbr --add podr podman run
abbr --add podi podman images
abbr --add podc podman container
abbr --add pods podman machine start
abbr --add podk podman machine stop
