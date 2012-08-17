#encoding:UTF-8
class AuthenticationsController < ApplicationController
	
	def create
		auth = request.env["omniauth.auth"]
		
		# Try to find authentication first
		authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
		
		if authentication
			# Authentication found, sign the usuario in.
			flash[:notice] = "Login realizado com sucesso."
			authentication.usuario.apply_changes(auth)
			authentication.usuario.save
			sign_in_and_redirect(:usuario, authentication.usuario)
			else
			# Authentication not found, thus a new usuario.
			usuario = Usuario.new
			usuario.apply_omniauth(auth)
			if usuario.save(:validate => false)
				flash[:notice] = "Conta foi criada com sucesso."
				
				#usuario.facebook.link!(:link => 'https://www.facebook.com/luizcosta.pqt', :message => 'Agora ' + usuario.name + ' vai concorrer a ingressos das melhores festa, entre nessa você também!')
				
				sign_in_and_redirect(:usuario, usuario)
				else
				flash[:error] = "Erro na criação da conta. Por favor, tente novamente."
				redirect_to root_url
			end
		end
	end

end
