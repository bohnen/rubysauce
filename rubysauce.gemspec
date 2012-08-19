Gem::Specification.new do |s|
  s.name        = "rubysauce"
  s.version     = "0.1.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tadatoshi Sekiguchi"]
  s.email       = ["bohnen.net@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{command line tool for SauceLabs.}
  s.description = %q{command line tool for SauceLabs.}
  #s.files       = ["bin/sauce-jobs","lib/restapi.rb","lib/jobs.rb"]
  s.files       = [Dir.glob('bin/*'),Dir.glob('lib/*')]
  s.executables = ["sauce-jobs"]
  s.add_dependency("rest-client")
  s.add_dependency("json")
end
