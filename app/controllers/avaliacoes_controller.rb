class AvaliacoesController < ApplicationController
	before_filter :logged_in

  def create
    @avaliacao = current_usuario.avaliacoes.build(:empresa_id => params[:empresa_id], :status => params[:status])
    respond_to do |format|
      if @avaliacao.save
        format.json { render :json => @avaliacao }
      end
    end
  end

end
