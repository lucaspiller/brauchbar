require 'rubygems'
require 'rake'

$LOAD_PATH.unshift 'lib'

require 'rake/rdoctask'
require 'rspec/core/rake_task'
require 'rspec/core/version'

Rspec::Core::RakeTask.new(:spec)
task :default => :spec
