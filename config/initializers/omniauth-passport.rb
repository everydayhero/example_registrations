require 'omniauth-passport'

# We are going to use development's version of Passport. When this
# changes we can delete this file.
OmniAuth::Strategies::Passport.default_options.client_options.site = Rails.application.config.passport_config[:url]
