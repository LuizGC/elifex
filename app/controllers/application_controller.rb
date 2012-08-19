class ApplicationController < ActionController::Base
  protect_from_forgery
	
	protected
	def logged_in
		unless usuario_signed_in?
			redirect_to root_path
    end
	end
end
