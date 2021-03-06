require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

module ExampleRegistrations
  class Application < Rails::Application
    config.load_config = ->(file) {
      config_file = config.root.join 'config', file

      if config_file && config_file.exist?
        YAML.load_file config_file
      else
        namespace = file.split('.').first.to_s.upcase + '_'
        hash      = ENV.select { |key| key =~ /^#{namespace.upcase}/ }
        new_hash  = {}
        hash.each do |key, value|
          new_key = key.gsub(namespace, '').downcase.to_sym
          new_hash[new_key] = value
        end
        new_hash
      end
    }

    config.omniauth_config   = config.load_config.call('omniauth.yml')
    config.fundraiser_config = config.load_config.call('fundraiser_config.yml')
    config.passport_config   = config.load_config.call('passport_config.yml')

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
  end
end
