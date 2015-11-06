# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 's3_cleaner/version'

Gem::Specification.new do |spec|
  spec.name          = "s3_cleaner"
  spec.version       = S3Cleaner::VERSION
  spec.authors       = ["MrPowers"]
  spec.email         = ["matthewkevinpowers@gmail.com"]

  spec.summary       = %q{Deletes old releases in a S3 directory}
  spec.description   = %q{Keeps n releases in S3}
  spec.homepage      = "https://github.com/mrpowers/s3_cleaner"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'aws-sdk', '< 2'
end
