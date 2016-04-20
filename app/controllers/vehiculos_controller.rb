class VehiculosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_vehiculo, only: [:show, :edit, :update, :destroy]

  # GET /vehiculos
  # GET /vehiculos.json
  def index
    @tipo_vehiculos = TipoVehiculo.all
    if params[:search]
      @vehiculos = Vehiculo.search(params[:search]).order("created_at DESC")
    else
      @vehiculos = Vehiculo.all.order('created_at DESC')
    end
  end

  # GET /vehiculos/1
  # GET /vehiculos/1.json
  def show
  end

  # GET /vehiculos/new
  def new
    
    @tipo_vehiculos=TipoVehiculo.where(id: params[:tipo_vehiculo_id])
    @modelo_vehiculos=ModeloVehiculo.where(tipo_vehiculo_id: params[:tipo_vehiculo_id])
    @marca_vehiculos=MarcaVehiculo.where(id: ModeloVehiculo.select(:marca_vehiculo_id).where(tipo_vehiculo_id: params[:tipo_vehiculo_id]))

    @vehiculo = Vehiculo.new(tipo_vehiculo_id: params[:tipo_vehiculo_id])
  end

  # GET /vehiculos/1/edit
  def edit
    @tipo_vehiculo = TipoVehiculo.find(@vehiculo.tipo_vehiculo_id)
    @tipo_vehiculos=TipoVehiculo.where(id: params[:tipo_vehiculo_id])
    @modelo_vehiculos=ModeloVehiculo.where(tipo_vehiculo_id: params[:tipo_vehiculo_id])
    @marca_vehiculos=MarcaVehiculo.where(id: ModeloVehiculo.select(:marca_vehiculo_id).where(tipo_vehiculo_id: @vehiculo.tipo_vehiculo_id))

  end

  # POST /vehiculos
  # POST /vehiculos.json
  def create
    @tipo_vehiculos=TipoVehiculo.all
    @vehiculo = Vehiculo.new(vehiculo_params)

    respond_to do |format|
      if @vehiculo.save
        format.html { redirect_to @vehiculo, notice: 'Vehiculo was successfully created.' }
        format.json { render :show, status: :created, location: @vehiculo }
      else
        format.html { render :new }
        format.json { render json: @vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehiculos/1
  # PATCH/PUT /vehiculos/1.json
  def update
    respond_to do |format|
      if @vehiculo.update(vehiculo_params)
        format.html { redirect_to @vehiculo, notice: 'Vehiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehiculo }
      else
        format.html { render :edit }
        format.json { render json: @vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehiculos/1
  # DELETE /vehiculos/1.json
  def destroy
    @vehiculo.destroy
    respond_to do |format|
      format.html { redirect_to vehiculos_url, notice: 'Vehiculo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehiculo
      @vehiculo = Vehiculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehiculo_params
      params.require(:vehiculo).permit(:serie, :placas, :ano_vehiculo, :persona_id, :tipo_vehiculo_id, :marca_vehiculo_id, :modelo_vehiculo_id, :estado_operativo_id, :_destroy, caracteristicas: params[:vehiculo][:caracteristicas].try(:keys))
    end
end