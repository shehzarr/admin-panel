Rails.application.configure do
  config.stripe = {
    publishable_key: Rails.application.credentials.dig(:STRIPE_PUBLISHABLE_KEY),
    secret_key: Rails.application.credentials.dig(:STRIPE_SECRET_KEY)
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]