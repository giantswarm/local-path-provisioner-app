# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/giantswarm/local-path-provisioner-app/releases/tag/v0.1.0
