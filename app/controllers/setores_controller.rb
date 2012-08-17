class SetoresController < ApplicationController
  # GET /setores
  # GET /setores.json
  def index
    @setores = Setor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @setores }
    end
  end

  # GET /setores/1
  # GET /setores/1.json
  def show
    @setor = Setor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setor }
    end
  end

  # GET /setores/new
  # GET /setores/new.json
  def new
    @setor = Setor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @setor }
    end
  end

  # GET /setores/1/edit
  def edit
    @setor = Setor.find(params[:id])
  end

  # POST /setores
  # POST /setores.json
  def create
    @setor = Setor.new(params[:setor])

    respond_to do |format|
      if @setor.save
        format.html { redirect_to @setor, notice: 'Setor was successfully created.' }
        format.json { render json: @setor, status: :created, location: @setor }
      else
        format.html { render action: "new" }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /setores/1
  # PUT /setores/1.json
  def update
    @setor = Setor.find(params[:id])

    respond_to do |format|
      if @setor.update_attributes(params[:setor])
        format.html { redirect_to @setor, notice: 'Setor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setores/1
  # DELETE /setores/1.json
  def destroy
    @setor = Setor.find(params[:id])
    @setor.destroy

    respond_to do |format|
      format.html { redirect_to setores_url }
      format.json { head :no_content }
    end
  end
end
