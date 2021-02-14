# frozen_string_literal: true

require_relative "lib/acnh_critterpedia/version"

Gem::Specification.new do |spec|
  spec.name          = "acnh_critterpedia"
  spec.version       = AcnhCritterpedia::VERSION
  spec.authors       = ["Liz Wilson"]
  spec.email         = ["lizriderwilson@gmail.com"]

  spec.summary       = "CLI Critterpedia for ACNH"
  spec.description   = "ACNH Critterpedia is a CLI application that allows searching for critters and their availability for Animal Crossing: New Horizons"
  spec.homepage      = "https://github.com/merlumina/acnh-critterpedia/"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.1")

  spec.metadata["homepage_uri"] = "https://github.com/merlumina/acnh-critterpedia/"
  spec.metadata["source_code_uri"] = "https://github.com/merlumina/acnh-critterpedia/"
  spec.metadata["changelog_uri"] = "https://github.com/merlumina/acnh-critterpedia/blob/main/changelog.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir        = "bin"
  spec.executables   = 'acnh_critterpedia'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "httparty"
  spec.add_dependency "require_all"
  spec.add_dependency "colorize"
  spec.add_dependency "terminal-table"
  spec.add_dependency "sqlite3"

end
