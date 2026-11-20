#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly SCRIPT_DIR
source "${SCRIPT_DIR}"/../../_helpers.sh

echo "Patching template helpers"

set -x
git apply "${SCRIPT_DIR}/_deployment.yaml.patch"
{ set +x; } 2>/dev/null

cp -av "${SCRIPT_DIR}"/manifests/* "${CHART_DIR}/templates/"
