require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'echoe'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the enum_simulator plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the enum_simulator plugin.'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'EnumSimulator'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Echoe.new('enum_simulator', '1.0.1') do |p|
  p.description     = 'A simple plugin for abstracting out standard ActiveRecord enumerated attributes.'
  p.url             = 'git://github.com/FOMNick/enum_simulator.git'
  p.author          = 'Jeremy Holland'
  p.email           = 'jeremy@jeremypholland.com'
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []
end
