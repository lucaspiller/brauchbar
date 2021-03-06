require 'rubygems'
require 'rake'

$LOAD_PATH.unshift 'lib'

require 'rake/rdoctask'
require 'rspec/core/rake_task'
require 'rspec/core/version'

Rspec::Core::RakeTask.new(:spec)
task :default => :spec


require 'rake/gempackagetask'
require 'rake/rdoctask'

# This builds the actual gem. For details of what all these options
# mean, and other ones you can add, check the documentation here:
#
#   http://rubygems.org/read/chapter/20
#
spec = Gem::Specification.new do |s|

  # Change these as appropriate
  s.name              = "brauchbar"
  s.version           = "0.1.0"
  s.summary           = "adj, German. practical, convenient, utilizable, feasible AKA a decent HTTP client for Ruby"
  s.author            = "Luca Spiller"
  s.email             = "luca@stackednotion.com"
  s.homepage          = "http://www.stackednotion.com/"

  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.md)
  s.rdoc_options      = %w(--main README.md)

  # Add any extra files to include in the gem
  s.files             = %w(Gemfile Rakefile README.md) + Dir.glob("{spec,lib/**/*}")
  s.require_paths     = ["lib"]

  # If you want to depend on other gems, add them here, along with any
  # relevant versions
  s.add_dependency("patron", "0.4.6")

  # If your tests use any gems, include them here
  s.add_development_dependency("rspec", ">=2.0.0.beta.5")
end

# This task actually builds the gem. We also regenerate a static
# .gemspec file, which is useful if something (i.e. GitHub) will
# be automatically building a gem for this project. If you're not
# using GitHub, edit as appropriate.
#
# To publish your gem online, install the 'gemcutter' gem; Read more 
# about that here: http://gemcutter.org/pages/gem_docs
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

task :package => :gemspec

# Generate documentation
Rake::RDocTask.new do |rd|
  rd.main = "README.md"
  rd.rdoc_files.include("README.md", "lib/**/*.rb")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end
