class MarcaVehiculosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_marca_vehiculo, only: [:show, :edit, :update, :destroy]
  before_action :set_modelo_vehiculos, only: [:show]

  # GET /marca_vehiculos
  # GET /marca_vehiculos.json
  def index
    @marca_vehiculos = MarcaVehiculo.all
  end

  # GET /marca_vehiculos/1
  # GET /marca_vehiculos/1.json
  def show
  end

  # GET /marca_vehiculos/new
  def new
    # se debe de incluir el tipo de vehiculo y el modelo para cuando se desea adicionar un nuevo modelo a la marca
    @tipo_vehiculos = TipoVehiculo.all
    @marca_vehiculo = MarcaVehiculo.new
  end

  # GET /marca_vehiculos/1/edit
  def edit
    @tipo_vehiculos = TipoVehiculo.all
  end

  # POST /marca_vehiculos
  # POST /marca_vehiculos.json
  def create
    @marca_vehiculo = MarcaVehiculo.new(marca_vehiculo_params)

    respond_to do |format|
      if @marca_vehiculo.save
        format.html { redirect_to @marca_vehiculo, notice: 'Marca Vehiculo was successfully created.' }
        format.json { render :show, status: :created, location: @marca_vehiculo }
      else
        format.html { render :new }
        format.json { render json: @marca_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marca_vehiculos/1
  # PATCH/PUT /marca_vehiculos/1.json
  def update
    respond_to do |format|
      if @marca_vehiculo.update(marca_vehiculo_params)
        format.html { redirect_to @marca_vehiculo, notice: 'Marca Vrhiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @marca_vehiculo }
      else
        format.html { render :edit }
        format.json { render json: @marca_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marca_vehiculos/1
  # DELETE /marca_vehiculos/1.json
  def destroy
    @marca_vehiculo.destroy
    respond_to do |format|
      format.html { redirect_to marca_vehiculos_url, notice: 'Marca Vehiculo was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marca_vehiculo
      @marca_vehiculo = MarcaVehiculo.find(params[:id])
    end

    def set_modelo_vehiculos
      @modelo_vehiculos=ModeloVehiculo.where(marca_vehiculo_id: @marca_vehiculo.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marca_vehiculo_params
      params.require(:marca_vehiculo).permit(:clave_marca_vehiculo, :marca_vehiculo, modelo_vehiculos_attributes: [:id, :clave_modelo_vehiculo, :modelo_vehiculo, :marca_vehiculo_id, :tipo_vehiculo_id, :_destroy] )
    end
end
