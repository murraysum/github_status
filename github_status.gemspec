# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github_status/version'

Gem::Specification.new do |gem|
  gem.name          = "github_status"
  gem.version       = GithubStatus::VERSION
  gem.authors       = GithubStatus::AUTHORS
  gem.email         = GithubStatus::EMAIL
  gem.summary       = GithubStatus::SUMMARY
  gem.description   = GithubStatus::DESCRIPTION
  gem.homepage      = GithubStatus::HOMEPAGE

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("json")
  
  gem.add_development_dependency('rspec')
  gem.add_development_dependency 'webmock'
end
