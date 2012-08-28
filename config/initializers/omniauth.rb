Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['app_id'], ENV['app_secret'], :scope => 'email, user_birthday, user_education_history, publish_stream, offline_access, user_location'
end