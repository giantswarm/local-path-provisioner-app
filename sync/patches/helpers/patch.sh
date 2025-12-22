#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

repo_dir=$(git rev-parse --show-toplevel) ; readonly repo_dir
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly script_dir
script_dir_rel=".${script_dir#"${repo_dir}"}" ; readonly script_dir_rel

cd "${repo_dir}"

echo "Patching template helpers"

set -x

# first patch the values file with the generic changes
git apply "${script_dir_rel}/_helpers.tpl.patch"

{ set +x; } 2>/dev/null
