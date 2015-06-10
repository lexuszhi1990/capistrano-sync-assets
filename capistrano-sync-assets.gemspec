# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "capistrano/sync/assets/version"

Gem::Specification.new do |s|
  s.name        = "capistrano-sync-assets"
  s.version     = Capistrano::Sync::Asset::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.authors     = ['David Fu']
  s.email       = ['lexuszhi1990@gmail.com']
  s.summary     = %q{Capistrano 3 extensions for assets sync}
  s.description = %q{A collection of capistrano tasks for syncing assets}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency 'capistrano', '~> 3.0', '>= 3.0.1'
end

