#!/bin/sh

set -e

readonly VERSION_LABEL="gpg"
readonly REQUIRED_DEPS="
gpg
"

gpg_version() {
  echo "$( \
    gpg --version \
      | grep -0 "^${VERSION_LABEL}" \
      | cut -d " " -f 3 \
  )"
}

deps_check() {
  local dep

  for dep in $REQUIRED_DEPS
  do
    if [ ! -x "$(command -v "$dep")" ]; then
      error "$(printf "Command \"%s\" was not found." "$dep")"
    fi
  done
}

error() {
  echo -e >&2 "\n$1\n"
  exit 1
}
