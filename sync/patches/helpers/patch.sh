#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly SCRIPT_DIR
source "${SCRIPT_DIR}"/../../_helpers.sh

echo "Patching template helpers"

set -x
# first patch the values file with the generic changes
git apply "${SCRIPT_DIR_REL}/_helpers.tpl.patch"
{ set +x; } 2>/dev/null
