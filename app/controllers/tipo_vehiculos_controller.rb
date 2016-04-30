class TipoVehiculosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_tipo_vehiculo, only: [:show, :edit, :update, :destroy]
    before_action :set_caracteristica_tipo_vehiculos, only: [:show, :edit, :update]


  # GET /tipo_vehiculos
  # GET /tipo_vehiculos.json
  def index
    @tipo_vehiculos = TipoVehiculo.all
  end

  # GET /tipo_vehiculos/1
  # GET /tipo_vehiculos/1.json
  def show
  end

  # GET /tipo_vehiculos/new
  def new
    @tipo_datos = TipoDato.all
    @tipo_vehiculo = TipoVehiculo.new
  end

  # GET /tipo_vehiculos/1/edit
  def edit
    @tipo_datos = TipoDato.all
  end

  # POST /tipo_vehiculos
  # POST /tipo_vehiculos.json
  def create
    @tipo_vehiculo = TipoVehiculo.new(tipo_vehiculo_params)

    respond_to do |format|
      if @tipo_vehiculo.save
        format.html { redirect_to @tipo_vehiculo, notice: 'Tipo vehiculo was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_vehiculo }
      else
        format.html { render :new }
        format.json { render json: @tipo_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_vehiculos/1
  # PATCH/PUT /tipo_vehiculos/1.json
  def update
    respond_to do |format|
      if @tipo_vehiculo.update(tipo_vehiculo_params)
        format.html { redirect_to @tipo_vehiculo, notice: 'Tipo vehiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_vehiculo }
      else
        format.html { render :edit }
        format.json { render json: @tipo_vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_vehiculos/1
  # DELETE /tipo_vehiculos/1.json
  def destroy
    @tipo_vehiculo.destroy
    respond_to do |format|
      format.html { redirect_to tipo_vehiculos_url, notice: 'Tipo vehiculo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_vehiculo
      @tipo_vehiculo = TipoVehiculo.find(params[:id])
    end
    def set_caracteristica_tipo_vehiculos
      @caracteristica_tipo_vehiculos=CaracteristicaTipoVehiculo.where(tipo_vehiculo_id: @tipo_vehiculo.id).order(:orden)

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_vehiculo_params
      params.require(:tipo_vehiculo).permit(:clave_tipo_vehiculo, :tipo_vehiculo, caracteristica_tipo_vehiculos_attributes: [:id, :caracteristica, :requerido, :tipo_dato_id, :tipo_vehiculo_id, :orden, :_destroy] )
    end

end
