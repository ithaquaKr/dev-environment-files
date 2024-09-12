# shellcheck shell=bash disable=SC2154
check_config_available() {
	# The configuration to check
	config_check=$1

	# Flag to track if the config is found
	found=false

	# Loop through the array to check if the config is in the array
	for config in "${configurations[@]}"; do
		if [[ "$config" == "$config_check" ]]; then
			found=true
			break
		fi
	done

	# If the config is not found, perform the action
	if [[ "$found" == false ]]; then
		fail "Error: Configuration $config_check not found"
	fi
}

get_default_dst_config_path() {
	config=$1
	default_conf_path=default_dst_path_$config
	echo "${!default_conf_path}"
}

get_source_config_path() {
	config=$1
	source_conf_path=src_path_$config
	echo "${PWD}/${!source_conf_path}"
}

ensure_dst_config_path_exist() {
	local full_path="$1"
	local dir_path
	dir_path=$(dirname "$full_path")
	info "$dir_path"
	mkdir -p "$dir_path"
	info "Configuration path $dir_path has been created"
}
