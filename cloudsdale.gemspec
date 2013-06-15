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
    "lib/cloudsdale/client.rb",
    "lib/cloudsdale/version.rb",
    "lib/cloudsdale/api/api.rb",
    "lib/cloudsdale/models/avatar.rb",
    "lib/cloudsdale/models/ban.rb",
    "lib/cloudsdale/models/chat.rb",
    "lib/cloudsdale/models/cloud.rb",
    "lib/cloudsdale/models/user.rb",
    "spec/lib/cloudsdale_spec.rb",
    "spec/lib/spec_helper.rb"
  ]

  s.test_files = [
    %q{spec/lib/cloudsdale_spec.rb},
    %q{spec/lib/spec_helper.rb}
  ]

  s.add_development_dependency "rspec", ["= 2.11.0"]
  s.add_development_dependency "pry", ['~> 0.9.10']
  s.add_runtime_dependency "faye", ["~> 0.8.6"]
  s.add_runtime_dependency "json", ["~> 1.7.5"]
  s.add_runtime_dependency "faraday", ['~> 0.8.4']
  s.add_runtime_dependency "faraday_middleware", ['~> 0.9.0']
  s.add_runtime_dependency "hashie", ['~> 1.2.0']
  s.add_runtime_dependency "data_mapper", ['~> 1.2.0']
  s.add_runtime_dependency "dm-types", ['~> 1.2.2']
  s.add_runtime_dependency "bcrypt-ruby", ["~> 3.0.0"]
end
