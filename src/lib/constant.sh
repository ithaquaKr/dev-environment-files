# shellcheck shell=bash disable=SC2034
# List available configuration
configurations=("jgit" "mise" "neofetch" "nvim" "skhd" "starship" "tmux" "wezterm" "yabai" "zsh")

# Define source path
src_path_jgit="jgit/config"
src_path_mise="mise/config.toml"
src_path_neofetch="neofetch/config.conf"
src_path_nvim="nvim/*"
src_path_skhd="skhd/skhdrc"
src_path_starship="starship/starship.toml"
src_path_tmux="tmux/tmux.conf"
src_path_wezterm="wezterm/wezterm.lua"
src_path_yabai="yabai/yabairc"
src_path_zsh="zsh/zshrc"

# Define default path
default_dst_path_jgit="${HOME}/.config/jgit/config"
default_dst_path_mise="${HOME}/.config/mise/config.toml"
default_dst_path_neofetch="${HOME}/.config/neofetch/config.conf"
default_dst_path_nvim="${HOME}/.config/nvim"
default_dst_path_skhd="${HOME}/.config/skhd/skhdrc"
default_dst_path_starship="${HOME}/.config/starship/starship.toml"
default_dst_path_tmux="${HOME}/.tmux.conf"
default_dst_path_wezterm="${HOME}/.wezterm.lua"
default_dst_path_yabai="${HOME}/.config/yabai/yabairc"
default_dst_path_zsh="${HOME}/.zshrc"
