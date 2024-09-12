# shellcheck shell=bash disable=SC2154
# Get configuration name
# TODO: Implement to check args short
config_name=${args[name]}

# Check if --path args not set, use default config dst
if [[ ${args[--path]} ]]; then
	config_dst=${args[--path]}
else
	config_dst=$(get_default_dst_config_path "$config_name")
	ensure_dst_config_path_exist "$config_dst"
fi
config_src=$(get_source_config_path "$config_name")
flag_overwrite=${args[--overwrite]}
flag_backup=${args[--backup]}

# Check if configuration input is available
check_config_available "$config_name"

# Check if both flags are set, and exit with an error if they are
if [[ $flag_backup && $flag_overwrite ]]; then
	fail "Error: Both --backup and --overwrite flags cannot be used together."
	exit 1
fi

# Check if the path exists and is a file, directory, or symlink
if [[ -f "$config_dst" || -d "$config_dst" || -L "$config_dst" ]]; then
	if [[ $flag_overwrite ]]; then
		rm -rf "$config_dst"
		process "Successfully removed: $config_dst"
	elif [[ $flag_backup ]]; then
		mv "$config_dst" "${config_dst}.backup"
		process "Successfully backed up: $config_dst to ${config_dst}.backup"
	else
		fail "Error: Configuration already exists: $config_dst"
	fi
fi

ln -s "$config_src" "$config_dst"
success "Apply configuration $config_name success."
