# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "enum_simulator"
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremy Holland", "Brandon Valentine"]
  s.date = "2012-09-15"
  s.description = "A simple plugin for abstracting out standard ActiveRecord enumerated attributes."
  s.email = ["jeremy@jeremypholland.com", "brandon@brandonvalentine.com"]
  s.extra_rdoc_files = ["README.rdoc", "lib/enum_simulator.rb"]
  s.files = ["Gemfile", "MIT-LICENSE", "README.rdoc", "Rakefile", "enum_simulator.gemspec", "init.rb", "install.rb", "lib/enum_simulator.rb", "spec/enum_simulator_spec.rb", "spec/resources/schema", "spec/spec_helper.rb", "spec/support/models/other_thingies.rb", "spec/support/models/thingy.rb", "uninstall.rb", "Manifest"]
  s.homepage = "git://github.com/centresource/enum_simulator.git"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Enum_simulator", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "enum_simulator"
  s.rubygems_version = "1.8.24"
  s.summary = "A simple plugin for abstracting out standard ActiveRecord enumerated attributes."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
