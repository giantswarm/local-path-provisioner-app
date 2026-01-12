# Keeping the chart up to date and preserving GS specific configuration

The `sync.sh` script is used to keep the chart up to date with the upstream chart and to preserve Giant Swarm specific changes.
We use `vendir` to manage the chart dependencies and `git patch` to apply the Giant Swarm specific changes. We also use `cp` to copy over specific files which are not present in the upstream chart.

## How to sync the chart with upstream

The `vendir.yml` configuration points to a specific version of the upstream chart.
Running `vendir sync` will sync the `helm` directory in this repository with the version defined there.

1. Update the chart version in the `vendir.yml` file.
2. Run `vendir sync`

## `diffs` directory

The `diffs` directory contains diffs of the chart files after applying the Giant Swarm specific changes - these show how our chart differs from the upstream chart. These are useful for a visual reference when updating the upstream chart in order to determine if upstream changes conflict with our patches.

## How to maintain Giant Swarm specific changes to upstream values and manifests

This folder contains the `sync.sh` script which does the following:

- Syncs the chart with the upstream chart. (See above)
- Applies all patches in the `patches` directory to the chart.
- Produces diffs of chart files and stores them in the `diffs` directory.

Generally running the script should be enough to keep the chart up to date with the upstream chart and to preserve Giant Swarm specific changes. Renovate is also configured to automatically open PRs against `vendir.yml` when a new upstream chart version is available.

1. Update the chart version in the `vendir.yml` file.
2. Run `./sync.sh`

However, if the upstream chart changes in a way that conflicts with a patch, it might have to be regenerated.

## How to generate a patch

Patches are simply git diffs of the changes made to the upstream chart.

1. Run `vendir sync` to get the latest upstream chart.
2. Commit only the manifest that you want to generate a patch for.
3. Make the Giant Swarm specific changes to the manifest.
4. Run `git diff helm/local-path-provisioner/PATH/TO/FILE > sync/patches/PATCH_NAME/_FILE_NAME.patch`
5. Run `./sync.sh` to apply all patches.

## Regenerating a patch

If a patch needs to be regenerated due to upstream changes because:

- It fails to apply.
- Upstream have introduced changes which need to also be patched.

Then you need to generate the patch from scratch using the upstream repo. This can be done as follows:

1. Clone the upstream repo in to a temporary directory:
  ```
  UPSTREAM=$(mktemp -d)
  git clone https://github.com/rancher/local-path-provisioner.git ${UPSTREAM}
  ```
2. Checkout the version that you are syncing to:
  ```
  cd ${UPSTREAM}
  git checkout vX.Y.Z
  ```
3. Make all changes to the relevant file (existing and new changes).
4. Generate the patch file:
  ```
  git diff PATH/TO/FILE > _FILE_NAME.patch
  ```
5. Copy the patch file to the relevant `sync/patches/PATCH_NAME/` directory in this repo, replacing the existing patch file.
6. Run `./sync.sh` to apply all patches.

## Current patches

### Chart

Location: `sync/patches/chart/`

- Adds Giant Swarm specific annotations to the chart metadata:
  - `io.giantswarm.application.audience`: Indicates whether the app is installed by Giant Swarm or customers
  - `io.giantswarm.application.managed`: Indicates whether the app is managed by Giant Swarm
  - `io.giantswarm.application.team`: Identifies the team responsible for maintaining this app
  - `io.giantswarm.application.upstream`: Points to the upstream repository
  - `io.giantswarm.application.upstream-chart-version`: Indicates the upstream chart version
- Replaces the `APP_VERSION_PLACEHOLDER` with the upstream release version being synced by vendir.
- Replaces the `VERSION_PLACEHOLDER` with the latest released version of the chart.

### Helpers

Location: `sync/patches/helpers/`

- Patches the `io.giantswarm.application.team` annotation into the common labels template.

### Kube Linter

Location: `sync/patches/kube-linter/`

- Adds kube-linter config file to the chart to disable certain checks.

### Templates

Location: `sync/patches/templates/`

- Patches the upstream `Deployment` and `helperImage` to pull images from Giant Swarm's container registry.
- Copies over Giant Swarm `PolicyException`s to the chart.

### Values

Location: `sync/patches/values/`

- Configures the `Deployment` and `helperImage`to pull images from Giant Swarm's container registry.
- Copies over `values.schema.json` to the chart.

## Adding new patches

To add a new patch for a different file:

1. Create a new directory under `sync/patches/` (e.g., `sync/patches/myfile/`)
2. Create the patch file with the naming convention `_filename.patch`
3. Create a `patch.sh` script following the pattern in other patch directories
4. Make the script executable: `chmod +x sync/patches/myfile/patch.sh`
5. Add the patch script to the `sync.sh` main script

## Troubleshooting

### Patch fails to apply

If a patch fails to apply after syncing with a new upstream version:

1. Check what changed in the upstream file
2. Follow the steps in "Regenerating a patch"
