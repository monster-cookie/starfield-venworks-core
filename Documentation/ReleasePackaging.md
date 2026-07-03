# Release Packaging

Release automation packages committed files from `Staging` and publishes the resulting archive to GitHub Releases and Nexus Mods. GitHub Actions does not compile Papyrus, assemble Spriggit YAML, or run Bethesda Archive2. Those tools require local Starfield and Creation Kit installations and must be run before tagging a release.

## Engineer Responsibilities

Before creating a release tag, update the generated files that correspond to the source changes being released.

- Papyrus changes: run the local Papyrus compile workflow and commit the updated `.pex` files under `Staging/Scripts`.
- Spriggit YAML or plugin changes: assemble the plugin locally and commit the updated `Staging/Venworks-Core.esm`.
- Archive content changes: run `Tools/createPackages.ps1` locally and commit the updated `.ba2` files in `Staging`.
- Changelog changes: move release notes from `Unreleased` into a `## Version x.y.z` section that matches the release tag without the leading `v`.

`Staging/Venworks-Core.esp` is an editing artifact. It may be committed for local workflows, but it is intentionally excluded from the release zip.

## Release Package Contents

The GitHub Action includes only these files in `Venworks-Core-x.y.z.zip`:

- `Staging/Venworks-Core.esm`
- `Staging/*.ba2`

No loose scripts, source files, ESP files, metadata files, or local tool outputs are included in the published zip.

## Local Pre-Tag Checklist

1. Run the local workflows needed for the changes being released.
2. Confirm `Staging/Venworks-Core.esm` is current.
3. Confirm all required `.ba2` archives are present in `Staging`.
4. Confirm `Staging/Venworks-Core.esp` is not needed by the release package.
5. Confirm `CHANGELOG.md` has a `## Version x.y.z` section for the tag.
6. Commit the updated release inputs.
7. Create and push a tag in `v<major>.<minor>.<patch>` format from current `master`.

## GitHub Configuration

The release workflow expects these repository secrets:

- `NEXUSMODS_API_KEY`
- `NEXUSMODS_FILE_ID`

The Nexus upload uses `Venworks - Core` as the display name, `main` as the category, and enables archive replacement and mod manager downloads.
