# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2021-02-01
### Added

- Command Line Interface that prompts user for choices, allows user to request the list of choices again, learn more about the program, and exit the program.
- AcnhCritterpedia::CLI class handles the flow of the program from the user's perspective.
- AcnhCritterpedia::API class requests data from the API and performs searches.
- AcnhCritterpedia::Critter class builds Critter instances from data gathered by API and has a method to print attributes in a readable format.

[Unreleased]: https://github.com/merlumina/acnh-critterpedia/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/merlumina/acnh-critterpedia/releases/tag/v1.0.0