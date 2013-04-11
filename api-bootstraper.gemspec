$:.push File.expand_path("../lib", __FILE__)
require "api_bootstraper/info"

Gem::Specification.new do |s|
  s.name        = "api-bootstraper"
  s.version     = ApiBootstraper::VERSION
  s.authors     = ["Nicolas Brousse"]
  s.email       = "TODO YOUREMAIL"
  s.homepage    = "TODO HOMEPAGE"
  s.summary     = "TODO SUMMARY"
  s.description = "TODO DESCRIPTION"
  s.required_rubygems_version = ">= 1.3.6"

  s.files         = `git ls-files`.split("\n").sort
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.license = 'MIT'

  s.add_dependency("rails", ">= 3.0.0")
  s.add_dependency("devise", ">= 1.1.2")
  s.add_dependency("meta_search", ">= 0.9.2")
  s.add_dependency("session_off")
  s.add_dependency("uuid")
  s.add_dependency("versionist")
end
