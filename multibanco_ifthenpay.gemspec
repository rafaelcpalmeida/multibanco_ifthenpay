
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "multibanco_ifthenpay/version"

Gem::Specification.new do |spec|
  spec.name          = "multibanco_ifthenpay"
  spec.version       = MultibancoIfthenpay::VERSION
  spec.authors       = ["Rafael Almeida"]
  spec.email         = ["rafaelcpalmeida@protonmail.com"]

  spec.summary       = "This gem aims to provide a simple way to integrate Ifthenpay's multibanco gateway into your Ruby / Ruby on Rails projects."
  spec.description   = "Multibanco is a Portuguese payment method that allows the customer to pay by bank reference. This gem aims to provide a simple way to integrate Ifthenpay's multibanco gateway into your Ruby / Ruby on Rails projects."
  spec.homepage      = "https://github.com/rafaelcpalmeida/multibanco_ifthenpay"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "coveralls"
end
