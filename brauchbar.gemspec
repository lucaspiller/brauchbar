# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{brauchbar}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Luca Spiller"]
  s.date = %q{2010-04-08}
  s.email = %q{luca@stackednotion.com}
  s.extra_rdoc_files = ["README.md"]
  s.files = ["Gemfile", "Rakefile", "README.md", "lib/brauchbar/request.rb", "lib/brauchbar/response.rb", "lib/brauchbar.rb"]
  s.homepage = %q{http://www.stackednotion.com/}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{adj, German. practical, convenient, utilizable, feasible AKA a decent HTTP client for Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<patron>, ["= 0.4.6"])
      s.add_development_dependency(%q<rspec>, [">= 2.0.0.beta.5"])
    else
      s.add_dependency(%q<patron>, ["= 0.4.6"])
      s.add_dependency(%q<rspec>, [">= 2.0.0.beta.5"])
    end
  else
    s.add_dependency(%q<patron>, ["= 0.4.6"])
    s.add_dependency(%q<rspec>, [">= 2.0.0.beta.5"])
  end
end
