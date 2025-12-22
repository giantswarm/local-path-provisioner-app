#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

repo_dir=$(git rev-parse --show-toplevel) ; readonly repo_dir
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly script_dir
script_dir_rel=".${script_dir#"${repo_dir}"}" ; readonly script_dir_rel
CHART_DIR="${repo_dir}/helm/local-path-provisioner" ; readonly CHART_DIR

cd "${repo_dir}"

echo "Patching values"

# get the upstream sync version from vendir.yml
UPSTREAM_SYNC_VERSION=$(yq -r .directories[0].contents[0].git.ref ${repo_dir}/vendir.yml)

set -x

# first patch the values file with the generic changes
git apply "${script_dir_rel}/_values.yaml.patch"

{ set +x; } 2>/dev/null

# then patch the chart values with the upstream version
sed -i -E "s/tag.*$/tag: ${UPSTREAM_SYNC_VERSION}/" "${CHART_DIR}/values.yaml"

cp "${script_dir_rel}/manifests/values.schema.json" "${CHART_DIR}/values.schema.json"

