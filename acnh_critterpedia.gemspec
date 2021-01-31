# frozen_string_literal: true

require_relative "lib/acnh_critterpedia/version"

Gem::Specification.new do |spec|
  spec.name          = "acnh_critterpedia"
  spec.version       = AcnhCritterpedia::VERSION
  spec.authors       = ["Liz Wilson"]
  spec.email         = ["lizriderwilson@gmail.com"]

  spec.summary       = "CLI Critterpedia for ACNH"
  spec.homepage      = "https://github.com/merlumina/acnh-critterpedia/"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.1")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = 'spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "httparty"
  spec.add_dependency "require_all"
  spec.add_dependency "colorize"
  spec.add_dependency "terminal-table"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
