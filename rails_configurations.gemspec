$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'version'
require 'date'

Gem::Specification.new do |spec|
  spec.name        = 'rails_configurations'
  spec.version     = RailsConfigurations::VERSION
  spec.date        = Date.today.to_s
  spec.summary     = 'RailsConfigurations'
  spec.description = 'Parse and store YAML configuration files in Railspec.configuration'
  spec.author      = 'chaunce'
  spec.email       = 'chaunce.slc@gmail.com'
  spec.homepage    = 'https://github.com/chaunce/rails_configurations'
  spec.license     = 'MIT'
  spec.files       = Dir['LICENSE', 'README.md', '{lib,spec}/**/*']
  spec.add_dependency 'rails', '>= 3.2'
  spec.add_development_dependency 'rspec', '>= 2.0.0'
end
