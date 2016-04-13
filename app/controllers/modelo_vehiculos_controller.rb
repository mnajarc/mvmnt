class ModeloVehiculosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_modelo_vehiculo, only: [:show, :edit, :update, :destroy]

  # GET /modelo_vehiculos
  # GET /modelo_vehiculos.json
  def index
    @modelo_vehiculos = ModeloVehiculo.all
  end

  # GET /modelo_vehiculos/1
  # GET /modelo_vehiculos/1.json
  def show
  end

  # GET /modelo_vehiculos/new
  def new
    @marca_vehiculos = MarcaVehiculo.all
    @tipo_vehiculos = TipoVehiculo.all
    @modelo_vehiculo = ModeloVehiculo.new
  end

  # GET /modelo_vehiculos/1/edit
  def edit
    @marca_vehiculos = MarcaVehiculo.all
    @tipo_vehiculos = TipoVehiculo.all
  end

  # POST /modelo_vehiculos
  # POST /modelo_vehiculos.json
  def create
    @modelo_vehiculo = ModeloVehiculo.new(modelo_vehiculo_params)

    respond_to do |format|
      if @modelo_vehiculo.save
        format.html { redirect_to @modelo_vehiculo, notice: 'ModeloVehiculo was successfully created.' }
        format.json { render :show, status: :created, location: @modelo_vehiculo }
      else
        format.html { render :new }
        format.json { render json: @modelo_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modelo_vehiculos/1
  # PATCH/PUT /modelo_vehiculos/1.json
  def update
    respond_to do |format|
      if @modelo_vehiculo.update(modelo_vehiculo_params)
        format.html { redirect_to @modelo_vehiculo, notice: 'ModeloVehiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @modelo_vehiculo }
      else
        format.html { render :edit }
        format.json { render json: @modelo_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelo_vehiculos/1
  # DELETE /modelo_vehiculos/1.json
  def destroy
    @modelo_vehiculo.destroy
    respond_to do |format|
      format.html { redirect_to modelo_vehiculos_url, notice: 'ModeloVehiculo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelo_vehiculo
      @modelo_vehiculo = ModeloVehiculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modelo_vehiculo_params
      params.require(:modelo_vehiculo).permit(:clave_modelo_vehiculo, :modelo_vehiculo, :marca_vehiculo_id, :tipo_vehiculo_id)
    end
end
