class CuponsController < ApplicationController
	before_filter :logged_in
	
  def create
    if Premio.find(params[:premio_id]).valor <= current_usuario.pontos
			@cupon = current_usuario.cupons.build(:premio_id => params[:premio_id])
			respond_to do |format|
				if @cupon.save
					format.json { render :json => @cupon }
				end
			end
		end
	
	end

end
