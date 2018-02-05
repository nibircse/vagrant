lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/subutai_cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'subutai_cli'
  spec.version       = SubutaiCli::VERSION
  spec.authors       = ["Subutai"]
  spec.email         = "info@subutai.io"
  spec.summary       = ["Subutai CLI. Execute subutai commands outside the Vagrant box"]
  spec.description   = "Part of Subutai Tooling"
  spec.homepage      = "https://github.com/subutai-io/vagrant"
  spec.homepage      = "https://subutai.io"
  spec.metadata      = { "source_code_uri" => "https://github.com/subutai-io/vagrant" }

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 0'
end
