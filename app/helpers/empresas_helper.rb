module EmpresasHelper
	
	
	def voto(opcao, empresa)
		if current_usuario.nil?
			link_opcao_without_action(opcao)
		else
			usuaio_log_in(empresa, opcao)
		end
	end
	
	private
	def usuaio_log_in(empresa, opcao)
		avaliacao = empresa.avaliacoes.find_by_usuario_id(current_usuario)
		
		if avaliacao.nil?
			link_opcao_with_action(opcao, empresa)
			else
			if(avaliacao.status == opcao)
				link_opcao_without_action(opcao)
			end
		end
	end
	
	private
	def link_opcao_without_action(opcao)
		link_to image_tag(image_name(opcao)), 'javascript:avoid(0);', :class => 'aviso_loga'
	end
	
	private
	def link_opcao_with_action(opcao, empresa)
		link_to image_tag(image_name(opcao)), avaliacoes_path(:empresa_id => empresa, :status => opcao), :method => :post, :remote => true, :class => :votar, :id => opcao.to_s
	end
	
	private
	def image_name(opcao)
		if opcao
			'vou.png'
			else
			'nao_vou.png'
		end
	end
	
end
