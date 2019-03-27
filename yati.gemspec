lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yati/version'

Gem::Specification.new do |spec|
  spec.name          = 'yati'
  spec.version       = Yati::VERSION
  spec.authors       = ['rikas']
  spec.email         = ['oterosantos@gmail.com']

  spec.summary       = %q{Yet Another Translation Interface.}
  spec.description   = %q{A simple Rails engine as a backoffice for translating your locales.}
  spec.homepage      = 'https://github.com/oterick/yati.'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
