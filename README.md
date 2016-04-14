rails_configurations
===========

Parse and store YAML configuration files in Rails.configuration

Usage
--------

add `rails_configurations` to your Gemfile

    gem 'rails_configurations'

load a YAML configuration file in an initializer

    sidekiq_yml = Rails.root.join('config', 'sidekiq.yml')
    Rails.configuration.parse(sidekiq_yml)

access your configuration data

    Rails.configuration.sidekiq_configuration
