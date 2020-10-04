# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-sunspot"
  gem.version       = '1.0.0'
  gem.authors       = ["Navin Kumar"]
  gem.email         = ["navinspm@gmail.com"]
  gem.description   = %q{Capistrano task for sunspot}
  gem.summary       = %q{Capistrano task for sunspot}
  gem.homepage      = "https://github.com/navinspm/capistrano-sunspot"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano', '~> 3.14'
  gem.add_dependency 'capistrano-bundler', '~> 2.0'
end
