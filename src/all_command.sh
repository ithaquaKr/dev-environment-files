# shellcheck shell=bash disable=SC2154

# Get flag
overwrite_all=${args[--overwrite]}
backup_all=${args[--backup]}
skip_all=${args[--skip]}

# Ensure that only one of the overwrite, backup, or skip flags is set at a time
if [[ ($overwrite_all && $backup_all) || ($overwrite_all && $skip_all) || ($backup_all && $skip_all) ]]; then
	fail "Error: --overwrite, --backup, and --skip flags are mutually exclusive."
	exit 1
fi

for config in "${configurations[@]}"; do
	default_config_dst=$(get_default_dst_config_path "$config")
	default_config_src=$(get_source_config_path "$config")
	ensure_dst_config_path_exist "$default_config_dst"

	overwrite=
	backup=
	skip=
	action=

	info "Default config DST: $default_config_dst"
	info "Default config SRC: $default_config_src"

	if [[ -f "$default_config_dst" || -d "$default_config_dst" || -L "$default_config_dst" ]]; then
		info "Destination exists: $default_config_dst"

		# Check if no global flags are set (backup_all, overwrite_all, skip_all)
		if [[ ! "$overwrite_all" && ! "$backup_all" && ! "$skip_all" ]]; then
			current_src="$(readlink "$default_config_dst" 2>/dev/null || true)" # Allow readlink failure
			info "Current SRC: $current_src"

			# If the symlink is already pointing to the correct source, skip
			if [[ "$current_src" == "$default_config_src" ]]; then
				info "Symlink is correct, skipping $config."
				skip=true
			else
				# Ask user for action if the file already exists and flags aren't preset
				user "File already exists: $default_config_dst ($(basename "$default_config_src")). What do you want to do?\n\
	       [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"

				read -r -n 1 action </dev/tty
				case "$action" in
				o)
					overwrite=true
					;;
				O)
					overwrite_all=true
					;;
				b)
					backup=true
					;;
				B)
					backup_all=true
					;;
				s)
					skip=true
					;;
				S)
					skip_all=true
					;;
				*)
					fail "Invalid option, skipping."
					skip=true
					;;
				esac
			fi
		fi

		# Apply global or local flags to decide the action
		overwrite=${overwrite:-$overwrite_all}
		backup=${backup:-$backup_all}
		skip=${skip:-$skip_all}

		# Perform actions based on the flags
		if [[ $overwrite ]]; then
			rm -rf "$default_config_dst"
			process "Removed: $default_config_dst"
		fi

		if [[ $backup ]]; then
			mv "$default_config_dst" "${default_config_dst}.backup"
			process "Backed up: $default_config_dst to ${default_config_dst}.backup"
		fi

		if [[ $skip ]]; then
			process "Skipped: $default_config_dst"
		fi
	fi

	# If skip flag is not set, apply the configuration
	if [[ ! $skip ]]; then
		ln -s "$default_config_src" "$default_config_dst"
		success "Applied configuration for $config successfully."
	fi
done

success "All configurations applied successfully."
