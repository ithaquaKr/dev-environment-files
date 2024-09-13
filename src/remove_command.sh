# shellcheck shell=bash disable=SC2154

# Get flag
auto_approve=${args[--approve]}

# Get config name
config=${args[name]}

remove_all=
action=

if [[ -z "$config" ]]; then
	info "You didn't specify the config name to remove. All the configuration that has been applied will be removed."
	user "Do you want to remove all? [y]es, [n]o?"
	read -r -n 1 action </dev/tty
	case "$action" in
	y)
		remove_all=true
		;;
	n)
		info "Action has been canceled."
		exit 1
		;;
	*)
		fail "ERROR: Invalid option, skipping."
		exit 1
		;;
	esac
fi

default_config_src=$(get_source_config_path "$config")

if [[ "$remove_all" ]]; then
	if [[ ! "$auto_approve" ]]; then
		user "Confirm to remove all configurations? [y]es, [n]o?"
		read -r -n 1 action </dev/tty
		case "$action" in
		y) ;;
		n)
			info "Action has been cancel"
			exit 1
			;;
		*)
			fail "ERROR: Invalid option, skipping."
			exit 1
			;;
		esac
	fi
	for config in "${configurations[@]}"; do
		config_dst=$(get_default_dst_config_path "$config")

		if [[ -f "$config_dst" || -d "$config_dst" || -L "$config_dst" ]]; then
			rm -r "$config_dst"
			process "Remove config $config successfully."
		else
			fail_not_exit "Error: Config $config not found."
		fi
	done
	success "All configuration has been remove successfully."
else
	config_dst=$(get_default_dst_config_path "$config")
	current_src="$(readlink "$config_dst" 2>/dev/null || true)" # Allow readlink failure
	if [[ ! "$current_src" == "$default_config_src" ]]; then
		info "Your config is not pointing to the config source"
		user "Still want to remove? [y]es, [n]o?"
		read -r -n 1 action </dev/tty
		case "$action" in
		y) ;;
		n)
			info "Action has been cancel"
			exit 1
			;;
		*)
			fail "ERROR: Invalid option, skipping."
			exit 1
			;;
		esac
	fi

	if [[ -z "$auto_approve" ]]; then
		user "Confirm to remove $config? [y]es, [n]o?"
		read -r -n 1 action </dev/tty
		case "$action" in
		y) ;;
		n)
			info "Action has been canceled."
			exit 1
			;;
		*)
			fail "ERROR: Invalid option, skipping."
			exit 1
			;;
		esac
	fi
	rm -r "$config_dst"
	success "Remove config $config successfully."
fi
