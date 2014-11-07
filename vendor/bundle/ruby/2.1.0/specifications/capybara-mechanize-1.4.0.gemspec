# -*- encoding: utf-8 -*-
# stub: capybara-mechanize 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capybara-mechanize"
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jeroen van Dijk"]
  s.date = "2014-10-14"
  s.description = "RackTest driver for Capybara, but with remote request support thanks to mechanize"
  s.email = "jeroen@jeevidee.nl"
  s.homepage = "https://github.com/jeroenvandijk/capybara-mechanize"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.2.2"
  s.summary = "RackTest driver for Capybara with remote request support"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mechanize>, ["~> 2.7.0"])
      s.add_runtime_dependency(%q<capybara>, ["~> 2.4.4"])
    else
      s.add_dependency(%q<mechanize>, ["~> 2.7.0"])
      s.add_dependency(%q<capybara>, ["~> 2.4.4"])
    end
  else
    s.add_dependency(%q<mechanize>, ["~> 2.7.0"])
    s.add_dependency(%q<capybara>, ["~> 2.4.4"])
  end
end
