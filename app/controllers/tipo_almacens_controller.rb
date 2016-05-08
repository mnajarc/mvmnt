class TipoAlmacensController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_tipo_almacen, only: [:show, :edit, :update, :destroy]
  before_action :set_caracteristica_tipo_almacens, only: [:show, :edit, :update]
  # GET /tipo_almacens
  # GET /tipo_almacens.json
  def index
    @tipo_almacens = TipoAlmacen.all
  end

  # GET /tipo_almacens/1
  # GET /tipo_almacens/1.json
  def show
  end

  # GET /tipo_almacens/new
  def new
    @tipo_datos = TipoDato.all
    @tipo_almacen = TipoAlmacen.new
  end

  # GET /tipo_almacens/1/edit
  def edit
    @tipo_datos = TipoDato.all
  end

  # POST /tipo_almacens
  # POST /tipo_almacens.json
  def create
    @tipo_almacen = TipoAlmacen.new(tipo_almacen_params)

    respond_to do |format|
      if @tipo_almacen.save
        format.html { redirect_to @tipo_almacen, notice: 'Tipo almacen was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_almacen }
      else
        format.html { render :new }
        format.json { render json: @tipo_almacen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_almacens/1
  # PATCH/PUT /tipo_almacens/1.json
  def update
    respond_to do |format|
      if @tipo_almacen.update(tipo_almacen_params)
        format.html { redirect_to @tipo_almacen, notice: 'Tipo almacen was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_almacen }
      else
        format.html { render :edit }
        format.json { render json: @tipo_almacen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_almacens/1
  # DELETE /tipo_almacens/1.json
  def destroy
    @tipo_almacen.destroy
    respond_to do |format|
      format.html { redirect_to tipo_almacens_url, notice: 'Tipo almacen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_almacen
      @tipo_almacen = TipoAlmacen.find(params[:id])
    end
    def set_caracteristica_tipo_almacens
      @caracteristica_tipo_almacens=CaracteristicaTipoAlmacen.where(tipo_almacen_id: @tipo_almacen.id).order(:orden)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_almacen_params
      params.require(:tipo_almacen).permit(:clave_tipo_almacen, :nombre_tipo_almacen, caracteristica_tipo_almacens_attributes: [:id, :caracteristica, :requerido, :tipo_dato_id, :tipo_almacen_id, :orden, :_destroy])
    end
end
