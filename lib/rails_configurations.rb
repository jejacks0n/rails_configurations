require "yaml"
require "erb"

module Rails
  class Application

    # based on Rails::Application::Configuration#database_configuration
    # in rails/railties/lib/rails/application/configuration.rb
    module ConfigurationExtension
      extend ActiveSupport::Concern

      def parse(path)
        yaml = Pathname.new(path) if path

        config = if yaml && yaml.exist?
          YAML.load(ERB.new(yaml.read).result) || {}
        else
          raise "No such file - #{path}"
        end

        configuration_attr = :"#{path.to_s.split('/').last.split('.').first.underscore}_configuration"
        Rails::Application::Configuration.send(:attr_accessor, configuration_attr)

        Rails.configuration.send("#{configuration_attr}=", config.with_indifferent_access)
      rescue Psych::SyntaxError => e
        raise "YAML syntax error occurred while parsing #{path}. " \
              "Please note that YAML must be consistently indented using spaces. Tabs are not allowed. " \
              "Error: #{e.message}"
      rescue => e
        raise e, "Cannot load #{path.to_s.split('/').last.split('.').first.humanize.downcase} configuration:\n#{e.message}", e.backtrace
      end
    end

    Configuration.send(:include, ConfigurationExtension)
  end
end
