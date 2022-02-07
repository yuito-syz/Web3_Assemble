# -*- encoding: utf-8 -*-
# stub: romaji 0.2.4 ruby lib

Gem::Specification.new do |s|
  s.name = "romaji".freeze
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Shimpei Makimoto".freeze]
  s.date = "2017-10-13"
  s.description = "Yet another Romaji-Kana transliterator".freeze
  s.email = ["makimoto@tsuyabu.in".freeze]
  s.homepage = "https://github.com/makimoto/romaji".freeze
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Yet another Romaji-Kana transliterator".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rake>.freeze, [">= 0.8.0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 2.8.0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<guard>.freeze, [">= 1.0.1"])
    s.add_development_dependency(%q<guard-rspec>.freeze, [">= 0.7.0"])
    s.add_development_dependency(%q<growl>.freeze, [">= 1.0.3"])
    s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 0.8.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.8.0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<guard>.freeze, [">= 1.0.1"])
    s.add_dependency(%q<guard-rspec>.freeze, [">= 0.7.0"])
    s.add_dependency(%q<growl>.freeze, [">= 1.0.3"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
  end
end
