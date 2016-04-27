class RutaTransportesController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_ruta_transporte, only: [:show, :edit, :update, :destroy]

  # GET /ruta_transportes
  # GET /ruta_transportes.json
  def index
    if params[:search]
      @ruta_transportes = RutaTransporte.search(params[:search]).order("created_at DESC")
    else
      @ruta_transportes = RutaTransporte.all.order('created_at DESC')
    end
  end

  # GET /ruta_transportes/1
  # GET /ruta_transportes/1.json
  def show
  end

  # GET /ruta_transportes/new
  def new
    # Para las localidades que se van a requerir
    
    @nacionsa=@nacionsb=Nacion.all
    @estadosa=@estadosb=Estado.all
    @localidadsa=@localidadsb=Localidad.all

    @ruta_transporte = RutaTransporte.new()
  end

  # GET /ruta_transportes/1/edit
  def edit
    @nacionsa=@nacionsb=Nacion.all
    @estadosa=@estadosb=Estado.all
    @localidadsa=@localidadsb=Localidad.all

  end

  # POST /ruta_transportes
  # POST /ruta_transportes.json
  def create
    @ruta_transporte = RutaTransporte.new(ruta_transporte_params)

    respond_to do |format|
      if @ruta_transporte.save
        format.html { redirect_to @ruta_transporte, notice: 'RutaTransporte was successfully created.' }
        format.json { render :show, status: :created, location: @ruta_transporte }
      else
        format.html { render :new }
        format.json { render json: @ruta_transporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ruta_transportes/1
  # PATCH/PUT /ruta_transportes/1.json
  def update
    respond_to do |format|
      if @ruta_transporte.update(ruta_transporte_params)
        format.html { redirect_to @ruta_transporte, notice: 'RutaTransporte was successfully updated.' }
        format.json { render :show, status: :ok, location: @ruta_transporte }
      else
        format.html { render :edit }
        format.json { render json: @ruta_transporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruta_transportes/1
  # DELETE /ruta_transportes/1.json
  def destroy
    @ruta_transporte.destroy
    respond_to do |format|
      format.html { redirect_to ruta_transportes_url, notice: 'RutaTransporte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruta_transporte
      @ruta_transporte = RutaTransporte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ruta_transporte_params
      params.require(:ruta_transporte).permit(:clave_ruta, :nombre_ruta, :kilometraje, :punto_a_id, :punto_b_id, :_destroy)
    end
end
