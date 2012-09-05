module PremiosHelper
	
	def concorrer_buttom(premio)
		if current_usuario.has_cupom_of(premio)
			link_without_action("Participando")
			else
			if premio.valor <= current_usuario.pontos
				link_with_action(premio)
				else
				link_without_action("Faltam #{premio.valor - current_usuario.pontos} votos.")
			end
		end
	end
	
	
	private
	def link_with_action(premio)
		link_to content_tag(:button, "Clique Aqui"), cupons_path(:premio_id => premio.id), :remote => true, :class => :concorrer, :method => :post
	end
	
	private
	def link_without_action(text)
		link_to content_tag(:button, text, :class=>:disabled),'javascript:avoid(0);', :class => :disabled, :remote => true, :method => :post
	end
	
end