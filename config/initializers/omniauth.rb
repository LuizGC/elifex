Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "[app_id]", "[app_secret]", :scope => 'email, user_birthday, user_education_history'
end