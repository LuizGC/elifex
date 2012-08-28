class ApplicationController < ActionController::Base
  protect_from_forgery
	
	protected
	def logged_in
		unless usuario_signed_in?
			redirect_to root_path
    end
	end
	
	protected
	def admin
		unless usuario_signed_in? and current_usuario.authentications.first.uid == ENV['admin_id']
			redirect_to root_path
    end
	end
	
	#para enviar mensagem para o facebook
	protected
	def image_path(image)
		if root_url.to_s.match(/localhost/).nil?
			root_url[0..-2] + view_context.image_path(image)
		else
			"http://img.boaspromocoes.com.br/aut/1709.jpg"
		end
	end
	
	protected
	def root_localhost
		if root_url.to_s.match(/localhost/).nil?
			root_url
			else
			"http://www.elifex.com.br"
		end
	end
	#fim metodos para enviar mensagem para o facebook
	
end
