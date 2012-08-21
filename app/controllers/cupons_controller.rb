#encoding:UTF-8
class CuponsController < ApplicationController
	before_filter :logged_in
	
  def create
		premio = Premio.find(params[:premio_id])
    if premio.valor <= current_usuario.pontos
			@cupon = current_usuario.cupons.build(:premio_id => premio.id)
			respond_to do |format|
				if @cupon.save
					current_usuario.facebook.feed!(:message => "#{current_usuario.nome} esta concorrendo a um #{premio.nome}. Venha participar também.", :picture => image_path(premio.image), :link => root_localhost,:name => "Elifex - Pesquisa de Mercado",:description => "Entre no Elifex vote e concorra a premios.")
					format.json { render :json => @cupon }
				end
			end
		end
	
	end

end
