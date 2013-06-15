Gem::Specification.new do |s|
  s.name = %q{cloudsdale}
  s.version = '0.0.1'
  s.date = %q{2010-04-28}
  s.summary = %q{Cloudsdale.org Client}
  s.description = %q{A client gem for Cloudsdale.org!}
  s.authors = [%q{Berwyn}]
  s.email = %q{berwyn@cloudsdale.org}
  s.homepage = %q{http://www.cloudsdale.org}

  s.files = `git ls-files`.split("\n")

  s.test_files = [
    %q{spec/lib/cloudsdale_spec.rb},
    %q{spec/lib/spec_helper.rb}
  ]

  s.add_development_dependency "rspec", ["= 2.11.0"]
  s.add_development_dependency "pry", ['~> 0.9.10']
  s.add_runtime_dependency "json", ["~> 1.7.5"]
  s.add_runtime_dependency "faraday", ['~> 0.8.4']
  s.add_runtime_dependency "faraday_middleware", ['~> 0.9.0']
  s.add_runtime_dependency "hashie", ['~> 2.0.0']
  s.add_runtime_dependency "bcrypt-ruby", ["~> 3.0.0"]
  s.add_runtime_dependency "faye-client"
end
