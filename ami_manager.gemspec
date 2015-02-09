# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'ami_manager'
  spec.version       = '0.0.1'
  spec.authors       = ['Ops Manager Team']
  spec.email         = ['cf-tempest-eng@pivotal.io']
  spec.summary       = %q{A tool for booting and tearing down Ops Manager AIMs}
  spec.description   = %q{A tool for booting and tearing down Ops Manager AIMs}
  spec.homepage      = ''

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'aws-sdk-v1'

  spec.add_development_dependency 'rspec', '~> 3.0'
end
