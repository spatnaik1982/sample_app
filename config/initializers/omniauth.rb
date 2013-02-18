OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '117719921742898','e9ac8f6340e330efd942b696390cd692'
  provider :google_oauth2, '968379088889-7c0kn5f6e6lisqj87031jo0i7va5niqv.apps.googleusercontent.com','q8O2GXqMl9v7wzIVvaVI2SXt'
end

