info() {
	printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

process() {
	printf "\r  [ \033[0;33m>>\033[0m ] %s\n" "$1"
}

success() {
	printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

fail() {
	printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
	exit
}

fail_not_exit() {
	printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
}

user() {
	printf "\r  [ \033[0;33m??\033[0m ] %s\n" "$1"
}
