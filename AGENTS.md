# AGENTS.md

## Repository Overview

A Home Assistant app repository containing two apps: `cloudflared` and `tailscale`. Both support only `amd64` and `aarch64`. Home Assistant apps were previously known as "add-ons" - use "app" in all user-facing text.

There is no local build system or test suite. Images are built and published to ghcr.io exclusively by GitHub Actions using the `home-assistant/builder` action.

## Commands

Lint (configured in `.pre-commit-config.yaml`):

```bash
prek run --all-files
```

yamllint rules: every YAML file starts with `---`, max line length 120, double quotes only when needed, `truthy` is an error (workflow `on:` keys need `# yamllint disable-line rule:truthy`).

## Versioning and Releases

`version:` in each app's `config.yaml` is both the app version and the upstream release version - CI passes it to the Dockerfile as `BUILD_VERSION` to download the upstream binary.

To update an app to a new upstream release, change only the `version:` line in `<app>/config.yaml`. Commit message convention: `<app> <version>`, comma-separated for multiple.

## CI (.github/workflows/)

- `build.yaml`: on push to `main`, rebuilds an app only if its `config.yaml`, `Dockerfile`, or `rootfs/` changed (`MONITORED_FILES`). Builds per-arch images (`ghcr.io/chrisx8/<arch>-hassio-<app>`) with `home-assistant/builder/actions/build-image`, then publishes a multi-arch manifest; build matrices come from `config.yaml` via `yq`/`jq`.
- `build_all.yaml`: manual `workflow_dispatch` that rebuilds everything.

## App Anatomy

Each app directory contains `config.yaml` (HA manifest: version, image, arch, options + schema), `Dockerfile`, `DOCS.md`, `README.md`, `translations/en.yaml` (UI labels for config options), and `rootfs/` (copied into the image root via `COPY rootfs /`).

Dockerfile requirements for the builder:

- Base image: `ghcr.io/home-assistant/${BUILD_ARCH}-base:latest` (Alpine, use `apk`)
- Must accept `ARG BUILD_ARCH` and `ARG BUILD_VERSION`, supplied by the builder action.

Startup scripts run under s6-overlay from the base image (`init: false` in `config.yaml`) and use bashio (`bashio::config`, `bashio::log.*`, etc.) to read options and log. When adding a config option, update `config.yaml` (`options` + `schema`), `translations/en.yaml`, `DOCS.md`, and the script that consumes it.
