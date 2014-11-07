# -*- encoding: utf-8 -*-
# stub: selenium-rails 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "selenium-rails"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chad Woolley, Others"]
  s.date = "2008-08-20"
  s.description = "Support for using Selenium RC with Rails"
  s.email = "thewoolleyman@gmail.com"
  s.extra_rdoc_files = ["lib/selenium_rails/selenium_driver_manager.rb", "lib/selenium_rails/selenium_helper.rb", "lib/selenium_rails/selenium_test_case.rb", "lib/selenium_rails/servers_runner.rb", "lib/selenium_rails.rb", "lib/selenium-rails.rb", "README.txt"]
  s.files = ["README.txt", "lib/selenium-rails.rb", "lib/selenium_rails.rb", "lib/selenium_rails/selenium_driver_manager.rb", "lib/selenium_rails/selenium_helper.rb", "lib/selenium_rails/selenium_test_case.rb", "lib/selenium_rails/servers_runner.rb"]
  s.homepage = "http://selenium-rails.rubyforge.org"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Selenium Rails", "--main", "README.txt"]
  s.rubyforge_project = "selenium-rails"
  s.rubygems_version = "2.2.2"
  s.summary = "Support for using Selenium RC with Rails."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<Selenium>, [">= 1.1.14"])
    else
      s.add_dependency(%q<Selenium>, [">= 1.1.14"])
    end
  else
    s.add_dependency(%q<Selenium>, [">= 1.1.14"])
  end
end
