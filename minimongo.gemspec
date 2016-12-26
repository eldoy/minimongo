Gem::Specification.new do |s|
  s.name        = 'minimongo'
  s.version     = '0.0.1'
  s.date        = '2016-12-26'
  s.summary     = "MongoDB Helpers for flat space apps"
  s.description = "Helpers that sits right on top of mongodb"
  s.authors     = ["Fugroup Limited"]
  s.email       = 'mail@fugroup.net'
  s.files       = ["lib/minimongo.rb"]
  s.add_runtime_dependency 'mongo', '~> 2.2'
  s.add_runtime_dependency 'bson_ext', '~> 0'
  s.add_development_dependency 'futest', '~> 0'
  s.homepage    = 'https://github.com/fugroup/minimongo'
  s.license     = 'MIT'
end
