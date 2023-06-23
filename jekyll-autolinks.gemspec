# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "jekyll-autolinks"
  spec.version       = "0.1.1"
  spec.authors       = ["ADoyle"]
  spec.email         = ["adoyle.h@gmail.com"]
  spec.summary       = "Autolink for your Jekyll site."
  spec.description   = "Automatically create <a> DOMs from standard URLs."
  spec.homepage      = "https://github.com/adoyle-h/jekyll-autolinks"
  spec.license       = "BSD-3-Clause"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", '>= 3.9.3'
  spec.add_dependency "rinku", '~> 2.0.6'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "shoulda"
  spec.add_development_dependency "mocha"
end
