# -*- encoding: utf-8 -*-
# stub: bundle_outdated_formatter 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bundle_outdated_formatter".freeze
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["emsk".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-06-29"
  s.description = "BundleOutdatedFormatter is a command-line tool to format output of `bundle outdated`".freeze
  s.email = ["emsk1987@gmail.com".freeze]
  s.executables = ["bof".freeze]
  s.files = ["exe/bof".freeze]
  s.homepage = "https://github.com/emsk/bundle_outdated_formatter".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Formatter for `bundle outdated`".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<psych>.freeze, [">= 2.2"])
    s.add_runtime_dependency(%q<rexml>.freeze, ["~> 3.2"])
    s.add_runtime_dependency(%q<thor>.freeze, [">= 0.20"])
    s.add_runtime_dependency(%q<tty-table>.freeze, ["~> 0.10"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<codecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.9"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.86"])
    s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 1.40"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<psych>.freeze, [">= 2.2"])
    s.add_dependency(%q<rexml>.freeze, ["~> 3.2"])
    s.add_dependency(%q<thor>.freeze, [">= 0.20"])
    s.add_dependency(%q<tty-table>.freeze, ["~> 0.10"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<codecov>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.9"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.86"])
    s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 1.40"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
