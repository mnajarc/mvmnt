class TipoProductosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_tipo_producto, only: [:show, :edit, :update, :destroy]
    before_action :set_caracteristica_tipo_productos, only: [:show, :edit, :update]


  # GET /tipo_productos
  # GET /tipo_productos.json
  def index
    @tipo_productos = TipoProducto.all
  end

  # GET /tipo_productos/1
  # GET /tipo_productos/1.json
  def show
  end

  # GET /tipo_productos/new
  def new
    @tipo_datos = TipoDato.all
    @tipo_producto = TipoProducto.new
  end

  # GET /tipo_productos/1/edit
  def edit
    @tipo_datos = TipoDato.all
  end

  # POST /tipo_productos
  # POST /tipo_productos.json
  def create
    @tipo_producto = TipoProducto.new(tipo_producto_params)

    respond_to do |format|
      if @tipo_producto.save
        format.html { redirect_to @tipo_producto, notice: 'Tipo producto was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_producto }
      else
        format.html { render :new }
        format.json { render json: @tipo_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_productos/1
  # PATCH/PUT /tipo_productos/1.json
  def update
    respond_to do |format|
      if @tipo_producto.update(tipo_producto_params)
        format.html { redirect_to @tipo_producto, notice: 'Tipo producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_producto }
      else
        format.html { render :edit }
        format.json { render json: @tipo_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_productos/1
  # DELETE /tipo_productos/1.json
  def destroy
    @tipo_producto.destroy
    respond_to do |format|
      format.html { redirect_to tipo_productos_url, notice: 'Tipo producto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_producto
      @tipo_producto = TipoProducto.find(params[:id])
    end
    def set_caracteristica_tipo_productos
      @caracteristica_tipo_productos=CaracteristicaTipoProducto.where(tipo_producto_id: @tipo_producto.id).order(:orden)

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_producto_params
      params.require(:tipo_producto).permit(:clave_tipo_producto, :nombre_tipo_producto, caracteristica_tipo_productos_attributes: [:id, :caracteristica, :requerido, :tipo_dato_id, :tipo_producto_id, :orden, :_destroy] )
    end

end

