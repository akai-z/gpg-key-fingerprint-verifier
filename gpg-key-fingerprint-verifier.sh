#!/bin/sh

set -Eeuo pipefail

readonly VERSION_LABEL="gpg"
readonly REQUIRED_DEPS=("gpg")

gpg_version() {
  echo "$( \
    gpg --version \
      | grep -0 "^${VERSION_LABEL}" \
      | cut -d " " -f 3 \
  )"
}
