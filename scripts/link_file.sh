#!/usr/bin/env bash

# Load helpers function
source $(dirname "$0")/helpers.sh

# Input variables
SRC=$1
DST=$2

OVERWRITE="false"
BACKUP="false"
SKIP="false"
ACTION=

if [ -f "$DST" ] || [ -d "$DST" ] || [ -L "$DST" ]; then

  if [ "$OVERWRITE_ALL" == "false" ] && [ "$BACKUP_ALL" == "false" ] && [ "$SKIP_ALL" == "false" ]; then

    # ignoring exit 1 from readlink in case where file already exists
    # shellcheck disable=SC2155
    currentSrc="$(readlink "$DST")"

    if [ "$currentSrc" == "$SRC" ]; then

      skip=true

    else

      user "File already exists: $DST ($(basename "$SRC")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
      read -n 1 ACTION </dev/tty

      case "$ACTION" in
      o)
        OVERWRITE=true
        ;;
      O)
        OVERWRITE_ALL=true
        ;;
      b)
        BACKUP=true
        ;;
      B)
        BACKUP_ALL=true
        ;;
      s)
        SKIP=true
        ;;
      S)
        SKIP_ALL=true
        ;;
      *) ;;
      esac

    fi

  fi

  OVERWRITE=${OVERWRITE:-$OVERWRITE_ALL}
  BACKUP=${BACKUP:-$BACKUP_ALL}
  SKIP=${SKIP:-$SKIP_ALL}

  if [ "$OVERWRITE" == "true" ]; then
    rm -rf "$DST"
    success "removed $DST"
  fi

  if [ "$BACKUP" == "true" ]; then
    mv "$DST" "${DST}.backup"
    success "moved $DST to ${DST}.backup"
  fi

  if [ "$SKIP" == "true" ]; then
    success "skipped $SRC"
  fi
fi

if [ "$SKIP" != "true" ]; then # "false" or empty
  ln -s "$1" "$2"
  success "linked $1 to $2"
fi
