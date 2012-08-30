#encoding:UTF-8
class CuponsController < ApplicationController
	before_filter :logged_in
	
  def create
		premio = Premio.find(params[:premio_id])
    if premio.valor <= current_usuario.pontos
			@cupon = current_usuario.cupons.build(:premio_id => premio.id)
			respond_to do |format|
				if @cupon.save
					begin
						current_usuario.facebook.feed!(:message => "#{current_usuario.nome} esta concorrendo a um #{premio.nome}. Participe e Concorra!", :picture => image_path(premio.image), :link => root_localhost,:name => "Elifex - Conhecendo melhor !",:description => "Entre, vote e concorra a premios.")
						current_usuario.permissao = true
						rescue
						current_usuario.permissao = false
					end
					format.json { render :json => @cupon }
				end
			end
		end
		
	end
	
end
