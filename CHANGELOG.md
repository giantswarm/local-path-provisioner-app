# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Run the sync script automatically on Renovate vendir branches and push the result for review.
- Add a check which fails a pull request if the sync script was not run.
- Add shared helpers file to sync dir.

### Changed

- Create the vendir update issue as the `giantswarm-project-automation` GitHub App instead of architectbot's `ISSUE_AUTOMATION` token, and take the board item when the board's auto-add adds it first (giantswarm/giantswarm#38800).
- Use the `giantswarm-release` GitHub App instead of the taylorbot personal access token to push sync commits.
- Update architect to v10.10.0 (giantswarm/local-path-provisioner-app#79)
- Update architect to v10.11.1 (giantswarm/local-path-provisioner-app#80)
- Add Github action to create an issue in `giantswarm/giantswarm` for Team Rocket on vendir updates.
- Use Linux tools to manipulate chart label instead of an inscrutable Perl command.
- Update carvel-dev/vendir to v0.46.3 (giantswarm/local-path-provisioner-app#96)
- Update actions/create-github-app-token to v3.3.0 (giantswarm/local-path-provisioner-app#98)
- Update architect to v10.14.18 (giantswarm/local-path-provisioner-app#99)
- Update architect to v10.15.1 (giantswarm/local-path-provisioner-app#100)
- Update architect to v10.16.3 (giantswarm/local-path-provisioner-app#101)
- Update architect to v10.16.6 (giantswarm/local-path-provisioner-app#105)
- Update architect to v10.16.7 (giantswarm/local-path-provisioner-app#106)

### Fixed

- The `helm.sh/chart` label is valid for long chart versions: the 63-character cut trims the whole trailing run of `-`, `.` and `_`.
- Fix changelog generation script.

## [0.6.0] - 2026-08-06

### Changed

- Update vendir https://github.com/rancher/local-path-provisioner to v0.0.37

## [0.5.0] - 2026-03-10

### Changed

- Update chart to upstream version 0.0.35.

## [0.4.1] - 2026-01-26

### Added

- Added CiliumNetworkPolicy to allow access to Kubenetes API server.

## [0.4.0] - 2026-01-22

### Changed

- Push chart to control-plane-catalog.

## [0.3.1] - 2026-01-20

### Fixed

- Correct app name in circleci config.

## [0.3.0] - 2026-01-16

### Added

- Add GS PolicyException.
- Add README to `sync` directory.
- Add GitHub actions workflow to run `sync.sh` on PRs.

### Changed

- Push to `kamaji-addons-app-collection`.
- Improve Chart.yaml metadata.

### Fixed

- Fix vendir patching to Chart.yaml.

## [0.2.0] - 2026-01-06

### Changed

- Chart: update to uptream chart version 0.0.34.

## [0.1.0] - 2025-12-23

### Added

- Initial sync of upstream chart at version 0.0.32.

### Changed

- Update renovate to disable some dependencies.

### Fixed

- Fix values.yaml patching logic.

[Unreleased]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.6.0...HEAD
[0.6.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.4.1...v0.5.0
[0.4.1]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.3.1...v0.4.0
[0.3.1]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/giantswarm/local-path-provisioner-app/releases/tag/v0.1.0
