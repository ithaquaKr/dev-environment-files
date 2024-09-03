# shellcheck shell=bash disable=SC2154

# List configurations
info "Available configurations"
for config in "${configurations[@]}"; do
	if [[ -d "$config" ]]; then
		info "- $config"
	fi
done
