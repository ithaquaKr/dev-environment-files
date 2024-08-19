#!/bin/bash

# List of folder names to ignore
ignore_list=("src" "fonts")

# Function to check if a folder name is in the ignore list
is_ignored() {
	local folder_name="$1"
	for ignore_folder in "${ignore_list[@]}"; do
		if [[ "$folder_name" == "$ignore_folder" ]]; then
			return 0
		fi
	done
	return 1
}

# List configurations
printf "Available configurations:\n"
for config in "$directory"/*; do
	if [[ -d "$config" ]]; then
		config_name=$(basename "$config")
		if ! is_ignored "$config_name"; then
			printf "  - %s\n" "$config_name"
		fi
	fi
done
