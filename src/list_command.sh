# shellcheck shell=bash disable=SC2154

# Function to print a line separator
print_line() {
	printf "  +----------------+------------+\n"
}

# Function to print the table header
print_header() {
	printf "  | %-14s | %-10s |\n" "Config" "Status"
}

# Function to print table rows
print_row() {
	printf "  | %-14s | %-10s |\n" "$1" "$2"
}

check_config_active() {
	config_dst=$1
	config_src=$2
	current_src="$(readlink "$config_dst" 2>/dev/null || true)" # Allow readlink failure

	# If the symlink is already pointing to the correct source, it mean configurations is enabled
	if [[ "$current_src" == "$config_src" ]]; then
		printf "\e[32m%-10s\e[0m" "Enabled"
	else
		printf "\e[31m%-10s\e[0m" "Disabled"
	fi
}

# List configurations
info "Available configurations"
print_line
print_header
print_line
for config in "${configurations[@]}"; do
	# TODO: Update this ??
	default_config_dst=$(get_default_dst_config_path "$config")
	default_config_src=$(get_source_config_path "$config")

	print_row "$config" "$(check_config_active "$default_config_dst" "$default_config_src")"
done
print_line
