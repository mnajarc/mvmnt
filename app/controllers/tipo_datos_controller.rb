class TipoDatosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_tipo_dato, only: [:show, :edit, :update, :destroy]

  # GET /tipo_datos
  # GET /tipo_datos.json
  def index
    @tipo_datos = TipoDato.all
  end

  # GET /tipo_datos/1
  # GET /tipo_datos/1.json
  def show
  end

  # GET /tipo_datos/new
  def new
    @tipo_dato = TipoDato.new
  end

  # GET /tipo_datos/1/edit
  def edit
  end

  # POST /tipo_datos
  # POST /tipo_datos.json
  def create
    @tipo_dato = TipoDato.new(tipo_dato_params)

    respond_to do |format|
      if @tipo_dato.save
        format.html { redirect_to @tipo_dato, notice: 'Tipo dato was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_dato }
      else
        format.html { render :new }
        format.json { render json: @tipo_dato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_datos/1
  # PATCH/PUT /tipo_datos/1.json
  def update
    respond_to do |format|
      if @tipo_dato.update(tipo_dato_params)
        format.html { redirect_to @tipo_dato, notice: 'Tipo dato was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_dato }
      else
        format.html { render :edit }
        format.json { render json: @tipo_dato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_datos/1
  # DELETE /tipo_datos/1.json
  def destroy
    @tipo_dato.destroy
    respond_to do |format|
      format.html { redirect_to tipo_datos_url, notice: 'Tipo dato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_dato
      @tipo_dato = TipoDato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_dato_params
      params.require(:tipo_dato).permit(:tipo_dato, :dataprot)
    end
end
