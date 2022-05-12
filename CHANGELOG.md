<!--

// Please add your own contribution below inside the Main section, no need to
// set a version number, that happens during a deploy.
//
// These docs are aimed at users rather than danger developers, so please limit technical
// terminology in here.

-->

## main

* Changed `da` to `del` in Spanish.
* Fixed processing of business names to work as described in README: only fix the business particles and leave the rest of the name alone.
* Make recognition of business names case insensitive

### 1.0.0

* Added link to rubydocs documentation.
* Added project to code-climate.
* Added support for native UTF-8 upcasing for ruby `>= 2.4`.
* Drop support for ruby 1.9.3 and updated development dependencies.

### 1.0.2

* Merged PR #5 by @judith-easybill:
  * Fixes business particle handling
  * Adds associated tests
  * Replaced mentions of `master` with `main`
* Added ruby 3.1.2 to tested versions
