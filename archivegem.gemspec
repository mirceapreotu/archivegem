# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'archivegem/version'

Gem::Specification.new do |spec|
  spec.name          = "archivegem"
  spec.version       = Archivegem::VERSION
  spec.authors       = ["Mircea Preotu"]
  spec.email         = ["mircea.preotu@gmail.com"]
  spec.licenses      = ['MIT']

  spec.summary       = %q{zip archive}
  spec.description   = %q{create zip archives}
  spec.homepage      = "http://mirceapreotu.com"
  
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "rubyzip"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
