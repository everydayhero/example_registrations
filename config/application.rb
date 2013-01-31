require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

module ExampleRegistrations
  class Application < Rails::Application
    config.load_config = ->(file) {
      config_file = config.root.join 'config', file

      yaml = if config_file && config_file.exist?
        YAML.load_file config_file
      else
        namespace = file.split('.').first + '_'
        hash      = ENV.select { |key| key =~ /^#{namespace.upcase}/ }
        hash.each do |key, value|
          new_key = key.gsub(namespace, '').downcase.to_sym
          hash[new_key] = value
          hash.delete(key)
        end
      end

      yaml || {}
    }

    config.omniauth_credentials = config.load_config.call('omniauth.yml')
    config.fundraiser_config    = config.load_config.call('fundraiser_config.yml')
    config.passport_config      = config.load_config.call('passport_config.yml')

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
