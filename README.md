# SwiftPMPlugins

_Helper plugins for Swift PM. os.log and intents_

[![Swift](https://github.com/JoeMatt/SwiftPMPlugins/actions/workflows/swift.yml/badge.svg)](https://github.com/JoeMatt/SwiftPMPlugins/actions/workflows/swift.yml)

![Alt](https://repobeats.axiom.co/api/embed/7bb013c63128c18542be91c99b99650bf266fb67.svg "Repobeats analytics image")

## Contents

### `CargoPlugin`

_WIP plugin to generate `xcodeframework` bundles with C headers out of `Rust` projects using a `Cargo.toml` build file.

### LoggerPlugin

_Auto adds `os.log` support and logger domain to targets.

### IntentBuilderPlugin

_Builds XCode intent files correctly in Swift PM_

Just add to any taret with Intents. No paths required. Intents should be left in `Sources/MyTarget`, not in `Resources`.

### MultiplatformBuildPlugin

_WIP test for multiplatform builds_
