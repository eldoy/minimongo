Gem::Specification.new do |s|
  s.name        = 'minimongo'
  s.version     = '0.0.2'
  s.date        = '2016-12-28'
  s.summary     = "MongoDB Helpers for flat space apps"
  s.description = "Helpers that sits right on top of mongodb with a nicer syntax"
  s.authors     = ["Fugroup Limited"]
  s.email       = 'mail@fugroup.net'
  s.files       = ["lib/minimongo.rb"]
  s.add_runtime_dependency 'mongo', '>= 2.2'
  s.add_runtime_dependency 'bson_ext', '>= 0'
  s.add_development_dependency 'futest', '>= 0'
  s.homepage    = 'https://github.com/fugroup/minimongo'
  s.license     = 'MIT'
end
