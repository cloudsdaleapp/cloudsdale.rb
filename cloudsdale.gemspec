Gem::Specification.new do |s|
  s.name = 'cloudsdale'
  s.version = '0.0.1'
  s.date = '2010-04-28'
  s.summary = "Cloudsdale.org Client"
  s.description = "A client gem for Cloudsdale.org!"
  s.authors = ["Berwyn"]
  s.email = 'berwyn@cloudsdale.org'
  s.files = ["lib/cloudsdale.rb"]
  s.homepage = 'http://www.cloudsdale.org'
  s.add_development_dependency "rspec",
    ["= 2.11.0"]
  s.add_runtime_dependency "datamapper",
    ["~> 1.2.0"]
  s.add_runtime_dependency "faye",
    ["~> 0.8.6"]
end