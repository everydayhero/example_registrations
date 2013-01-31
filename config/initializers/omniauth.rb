config = Rails.application.config

config.middleware.use OmniAuth::Builder do
  provider :passport, *config.omniauth_credentails.values_at(:key, :secret)
end
