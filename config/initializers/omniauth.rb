OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '117719921742898','e9ac8f6340e330efd942b696390cd692'
end

