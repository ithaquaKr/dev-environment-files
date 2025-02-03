# shellcheck shell=bash disable=SC2034
# List available configuration
configurations=("jgit" "mise" "neofetch" "nvim" "starship" "tmux" "wezterm" "zsh" "k9s" "btop" "fabric" "ton" "aerospace")

# Define source path
src_path_jgit="configs/jgit/config"
src_path_mise="configs/mise/config.toml"
src_path_neofetch="configs/neofetch/config.conf"
src_path_nvim="configs/nvim"
src_path_starship="configs/starship/starship.toml"
src_path_tmux="configs/tmux/tmux.conf"
src_path_wezterm="configs/wezterm/wezterm.lua"
src_path_zsh="configs/zsh/zshrc"
src_path_btop="configs/btop"
src_path_k9s="configs/k9s"
src_path_fabric="configs/fabric"
src_path_ton="configs/to-obsidian-note/config.yml"
src_path_aerospace="configs/aerospace/aerospace.toml"

# Define default path
default_dst_path_jgit="${HOME}/.config/jgit/config"
default_dst_path_mise="${HOME}/.config/mise/config.toml"
default_dst_path_neofetch="${HOME}/.config/neofetch/config.conf"
default_dst_path_nvim="${HOME}/.config/nvim"
default_dst_path_starship="${HOME}/.config/starship/starship.toml"
default_dst_path_tmux="${HOME}/.tmux.conf"
default_dst_path_wezterm="${HOME}/.wezterm.lua"
default_dst_path_zsh="${HOME}/.zshrc"
default_dst_path_btop="${HOME}/.config/btop"
default_dst_path_k9s="${HOME}/.config/k9s"
default_dst_path_fabric="${HOME}/.config/fabric"
default_dst_path_ton="${HOME}/.config/to-obsidian-note/config.yml"
default_dst_path_aerospace="${HOME}/.config/aerospace/aerospace.toml"
