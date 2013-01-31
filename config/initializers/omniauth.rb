config = Rails.application.config

config.middleware.use OmniAuth::Builder do
  config.omniauth_provider_credentials.each do |provider, credentials|
    provider provider, *credentials.values_at(:key, :secret)
  end
end
