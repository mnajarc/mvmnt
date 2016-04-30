class MarcaProductosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_marca_producto, only: [:show, :edit, :update, :destroy]
  before_action :set_modelo_productos, only: [:show]

  # GET /marca_productos
  # GET /marca_productos.json
  def index
    @marca_productos = MarcaProducto.all
  end

  # GET /marca_productos/1
  # GET /marca_productos/1.json
  def show
  end

  # GET /marca_productos/new
  def new
    # se debe de incluir el tipo de producto y el modelo para cuando se desea adicionar un nuevo modelo a la marca
    @tipo_productos = TipoProducto.all
    @marca_producto = MarcaProducto.new
  end

  # GET /marca_productos/1/edit
  def edit
    @tipo_productos = TipoProducto.all
  end

  # POST /marca_productos
  # POST /marca_productos.json
  def create
    @marca_producto = MarcaProducto.new(marca_producto_params)

    respond_to do |format|
      if @marca_producto.save
        format.html { redirect_to @marca_producto, notice: 'Marca Producto was successfully created.' }
        format.json { render :show, status: :created, location: @marca_producto }
      else
        format.html { render :new }
        format.json { render json: @marca_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marca_productos/1
  # PATCH/PUT /marca_productos/1.json
  def update
    respond_to do |format|
      if @marca_producto.update(marca_producto_params)
        format.html { redirect_to @marca_producto, notice: 'Marca Producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @marca_producto }
      else
        format.html { render :edit }
        format.json { render json: @marca_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marca_productos/1
  # DELETE /marca_productos/1.json
  def destroy
    @marca_producto.destroy
    respond_to do |format|
      format.html { redirect_to marca_productos_url, notice: 'Marca Producto was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marca_producto
      @marca_producto = MarcaProducto.find(params[:id])
    end

    def set_modelo_productos
      @modelo_productos=ModeloProducto.where(marca_producto_id: @marca_producto.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marca_producto_params
      params.require(:marca_producto).permit(:clave_marca, :nombre_marca, modelo_productos_attributes: [:id, :clave_modelo, :nombre_modelo, :marca_producto_id, :_destroy] )
    end

end
