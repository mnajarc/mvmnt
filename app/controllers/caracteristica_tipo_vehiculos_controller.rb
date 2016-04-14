class CaracteristicaTipoVehiculosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_caracteristica_tipo_vehiculo, only: [:show, :edit, :update, :destroy]

  # GET /caracteristica_tipo_vehiculos
  # GET /caracteristica_tipo_vehiculos.json
  def index
    @caracteristica_tipo_vehiculos = CaracteristicaTipoVehiculo.all
  end

  # GET /caracteristica_tipo_vehiculos/1
  # GET /caracteristica_tipo_vehiculos/1.json
  def show
  end

  # GET /caracteristica_tipo_vehiculos/new
  def new
    @tipo_vehiculos = TipoVehiculo.all
    @tipo_datos = TipoDato.all
    @caracteristica_tipo_vehiculo = CaracteristicaTipoVehiculo.new
  end

  # GET /caracteristica_tipo_vehiculos/1/edit
  def edit
    @tipo_vehiculos = TipoVehiculo.all
    @tipo_datos = TipoDato.all

  end

  # POST /caracteristica_tipo_vehiculos
  # POST /caracteristica_tipo_vehiculos.json
  def create
    @caracteristica_tipo_vehiculo = CaracteristicaTipoVehiculo.new(caracteristica_tipo_vehiculo_params)

    respond_to do |format|
      if @caracteristica_tipo_vehiculo.save
        format.html { redirect_to @caracteristica_tipo_vehiculo, notice: 'Caracteristica tipo Vehiculo was successfully created.' }
        format.json { render :show, status: :created, location: @caracteristica_tipo_vehiculo }
      else
        format.html { render :new }
        format.json { render json: @caracteristica_tipo_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caracteristica_tipo_vehiculos/1
  # PATCH/PUT /caracteristica_tipo_vehiculos/1.json
  def update
    respond_to do |format|
      if @caracteristica_tipo_vehiculo.update(caracteristica_tipo_vehiculo_params)
        format.html { redirect_to @caracteristica_tipo_vehiculo, notice: 'Caracteristica tipo Vehiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @caracteristica_tipo_vehiculo }
      else
        format.html { render :edit }
        format.json { render json: @caracteristica_tipo_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caracteristica_tipo_vehiculos/1
  # DELETE /caracteristica_tipo_vehiculos/1.json
  def destroy
    @caracteristica_tipo_vehiculo.destroy
    respond_to do |format|
      format.html { redirect_to caracteristica_tipo_vehiculos_url, notice: 'Caracteristica tipo Vehiculo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caracteristica_tipo_vehiculo
      @caracteristica_tipo_vehiculo = CaracteristicaTipoVehiculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caracteristica_tipo_vehiculo_params
      params.require(:caracteristica_tipo_vehiculo).permit(:caracteristica, :requerido, :tipo_dato_id, :tipo_vehiculo_id, :orden)
    end

end
