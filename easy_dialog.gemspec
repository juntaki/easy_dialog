# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_dialog/version'

Gem::Specification.new do |gem|
  gem.name          = "easy_dialog"
  gem.version       = EasyDialog::VERSION
  gem.authors       = ["juntaki"]
  gem.email         = ["me@juntaki.com"]
  gem.description   = %q{Easy CLI dialog}
  gem.summary       = %q{Easy CLI dialog}
  gem.homepage      = "https://github.com/juntaki/easy_dialog"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
