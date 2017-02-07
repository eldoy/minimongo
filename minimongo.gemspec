Gem::Specification.new do |s|
  s.name        = 'minimongo'
  s.version     = '0.1.1'
  s.date        = '2017-02-07'
  s.summary     = "Tiny MongoDB library"
  s.description = "Helpers that sits right on top of mongodb with a nicer syntax. Only 6 lines of code."
  s.authors     = ["Fugroup Limited"]
  s.email       = 'mail@fugroup.net'

  s.add_runtime_dependency 'mongo', '>= 2.2'
  s.add_development_dependency 'futest', '>= 0'

  s.homepage    = 'https://github.com/fugroup/minimongo'
  s.license     = 'MIT'

  s.require_paths = ['lib']
  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
end
