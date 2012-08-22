class EmpresasController < ApplicationController
  before_filter :logged_in, :except => [:index]
	
	# GET /empresas
  # GET /empresas.json
  def index
    @empresas = Empresa.order("setor_id, created_at DESC").page(params[:page]).per(6)
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
    @empresa = Empresa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @empresa }
    end
  end

  # GET /empresas/new
  # GET /empresas/new.json
  def new
    @empresa = Empresa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @empresa }
    end
  end

  # GET /empresas/1/edit
  def edit
    @empresa = Empresa.find(params[:id])
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(params[:empresa])

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to @empresa, :notice => 'Empresa was successfully created.' }
        format.json { render :json => @empresa, :status => :created, :location => @empresa }
      else
        format.html { render :action => "new" }
        format.json { render :json => @empresa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /empresas/1
  # PUT /empresas/1.json
  def update
    @empresa = Empresa.find(params[:id])

    respond_to do |format|
      if @empresa.update_attributes(params[:empresa])
        format.html { redirect_to @empresa, :notice => 'Empresa was successfully updated.' }
        format.json { head  :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @empresa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa = Empresa.find(params[:id])
    @empresa.destroy

    respond_to do |format|
      format.html { redirect_to empresas_url }
      format.json { head  :no_content }
    end
  end
end
