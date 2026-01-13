#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly dir
cd "${dir}/.."

set -x
# Sync using vendir
vendir sync
{ set +x; } 2>/dev/null

# patches
./sync/patches/chart/patch.sh
./sync/patches/values/patch.sh
./sync/patches/helpers/patch.sh
./sync/patches/templates/patch.sh
./sync/patches/kube-linter/patch.sh

# clear existing diffs and generate new ones.
# we clear old diffs out to see if the new sync introduced any changes.
rm -f ./diffs/*
# generate diffs between vendir directory and our final helm chart
for f in $(git --no-pager diff --no-exit-code --no-color --no-index vendor/local-path-provisioner/deploy/chart helm --name-only) ; do
    # skip files which we do not want to compare
    [[ "$f" == "helm/local-path-provisioner/Chart.yaml" ]] && continue
    [[ "$f" == "helm/local-path-provisioner/Chart.lock" ]] && continue
    [[ "$f" == "helm/local-path-provisioner/README.md" ]] && continue
    [[ "$f" == "helm/local-path-provisioner/values.schema.json" ]] && continue
    # ignore files we manage entirely ourselves
    [[ "$f" == "helm/local-path-provisioner/.kube-linter.yaml" ]] && continue
    [[ "$f" == "helm/local-path-provisioner/templates/policy-exceptions.yaml" ]] && continue
    # ignore subcharts
    [[ "$f" =~ ^helm/local-path-provisioner/charts/.* ]] && continue

    # normalise the base path by attempting to find the matching file.
    # falls back to /dev/null if it cannot find a matching file which means
    # the file will be treated as entirely new.
    base_file="vendor/local-path-provisioner/deploy/chart/${f#"helm/"}"
    [[ ! -e $base_file ]] && base_file="vendor/local-path-provisioner/${f#"helm/"}"
    [[ ! -e $base_file ]] && base_file="/dev/null"

    set +e
    set -x
    # generate the diffs and save to ./diffs
    # note: ${f//\//__} replaces all "/" with "__"
    git --no-pager diff --no-exit-code --no-color --no-index "$base_file" "${f}" \
        > "./diffs/${f//\//__}.patch"
    { set +x; } 2>/dev/null
    set -e
    ret=$?
    # only fail if the return code is not 0 (no diff) or 1 (diffs found)
    if [ $ret -ne 0 ] && [ $ret -ne 1 ] ; then
        exit $ret
    fi
done
