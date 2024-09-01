function error() {
	echo >&2 "[$(date +'%Y-%m-%dT%H:%M:%S')] ERROR: $1"
	shift
	for msg in "$@"; do echo >&2 "  $msg"; done
	exit 1
}
function log() {
	if ! [[ ${args[--quiet]} || $ITHACLI_QUIET ]]; then
		echo >&2 "[$(date +'%Y-%m-%dT%H:%M:%S')] $1"
		shift
		for msg in "$@"; do echo >&2 "  $msg"; done
	fi
}
