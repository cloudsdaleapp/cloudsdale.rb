Gem::Specification.new do |s|
  s.name = %q{cloudsdale}
  s.version = '0.0.1'
  s.date = %q{2010-04-28}
  s.summary = %q{Cloudsdale.org Client}
  s.description = %q{A client gem for Cloudsdale.org!}
  s.authors = [%q{Berwyn}]
  s.email = %q{berwyn@cloudsdale.org}
  s.homepage = %q{http://www.cloudsdale.org}

  s.files = [
    "lib/cloudsdale.rb",
    "lib/models/user.rb"
    "lib/models/cloud.rb",
    "spec/lib/cloudsdale_spec.rb",
    "spec/lib/spec_helper.rb"
  ]

  s.test_files = [
    %q{spec/lib/cloudsdale_spec.rb},
    %q{spec/lib/spec_helper.rb}
  ]
  
  s.add_development_dependency "rspec",
    ["= 2.11.0"]
  s.add_runtime_dependency "faye",
    ["~> 0.8.6"]
  s.add_runtime_dependency "rest-client",
    ["~> 1.6.7"]
  s.add_runtime_dependency "json",
    ["~> 1.7.5"]
end