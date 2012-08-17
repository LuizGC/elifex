Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "[app_id]", "[secret_id]", :scope => 'email, user_photos', :secure_image_url => true, :image_size => 'normal'
end