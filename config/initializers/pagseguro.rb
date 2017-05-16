PagSeguro.configure do |config|
  config.token = Rails.application.secrets.pagseguro_token
  config.email = Rails.application.secrets.pagseguro_email
end
