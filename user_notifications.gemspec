# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'user_notifications/version'

Gem::Specification.new do |spec|
  spec.name          = "user_notifications"
  spec.version       = UserNotifications::VERSION
  spec.authors       = ["Nicholas Firth-McCoy"]
  spec.email         = ["nicholas@2suggestions.com.au"]
  spec.summary       = "Super simple in-app notification handling for Rails apps"
  spec.homepage      = "https://github.com/nfm/user_notifications"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "rake"
end
