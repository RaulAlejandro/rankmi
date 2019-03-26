OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '70030524917-omq258g30rvnta0s16qbqcue2l08hsih.apps.googleusercontent.com', 'cmUDacy5APY1Ovr-rDxJnjeW', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end