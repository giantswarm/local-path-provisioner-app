# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.5.0...HEAD
[0.5.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.4.1...v0.5.0
[0.4.1]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.3.1...v0.4.0
[0.3.1]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/giantswarm/local-path-provisioner-app/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/giantswarm/local-path-provisioner-app/releases/tag/v0.1.0
