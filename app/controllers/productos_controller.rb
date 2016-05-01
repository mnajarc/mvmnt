class ProductosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_producto, only: [:show, :edit, :update, :destroy]
  before_action :set_catalogos, only: [:show, :edit, :update, :new]


  # GET /productos
  # GET /productos.json
  def index
    @tipo_productos = TipoProducto.all
    if params[:search]
      @productos = Producto.search(params[:search]).order("created_at DESC")
    else
      @productos = Producto.all.order('created_at DESC')
    end
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new(tipo_producto_id: params[:tipo_producto_id])
  end

  # GET /productos/1/edit
  def edit


  end

  # POST /productos
  # POST /productos.json
  def create
    @tipo_productos=TipoProducto.all
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto was successfully created.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'Producto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end
    
    def set_catalogos
      @tipo_productos=TipoProducto.where(id: params[:tipo_producto_id])
      @marca_productos=MarcaProducto.all
      @modelo_productos=ModeloProducto.all
      @unidads=Unidad.all


      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:sku, :nombre_producto, :precio, :marca_producto_id, :modelo_producto_id, :tipo_producto_id, :unidad_id, :_destroy, caracteristicas: params[:producto][:caracteristicas].try(:keys))
    end
end