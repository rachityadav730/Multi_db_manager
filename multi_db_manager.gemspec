# frozen_string_literal: true

require_relative "lib/multi_db_manager/version"

Gem::Specification.new do |spec|
  spec.name = "multi_db_manager"
  spec.version = MultiDbManager::VERSION
  spec.authors = ["Rachit yadav"]
  spec.email = ["rachit.r.yadav@gmail.com"]

  spec.summary = "TODO: Write a short summary, because RubyGems requires one."
  spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://rachit.in"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_runtime_dependency "mysql2"      # For MySQL
  spec.add_runtime_dependency "mongo"        # For MongoDB
  spec.add_runtime_dependency "arangodb"     # For ArangoDB
  spec.add_runtime_dependency "pg"           # For PostgreSQL

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

# spec.name        = "multi_db_manager"
# spec.version     = "0.1.0"
# spec.summary     = "A gem to manage multiple database connections"
# spec.description = "Provides a unified API for interacting with MySQL, MongoDB, ArangoDB, and PostgreSQL."
# spec.authors     = ["Your Name"]
# spec.email       = ["your.email@example.com"]
# spec.files       = Dir["lib/**/*.rb"]
# spec.homepage    = "https://example.com/multi_db_manager"
# spec.license     = "MIT"
