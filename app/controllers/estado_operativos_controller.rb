class EstadoOperativosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_estado_operativo, only: [:show, :edit, :update, :destroy]

  # GET /estado_operativos
  # GET /estado_operativos.json
  def index
    @estado_operativos = EstadoOperativo.all
  end

  # GET /estado_operativos/1
  # GET /estado_operativos/1.json
  def show
  end

  # GET /estado_operativos/new
  def new
    @estado_operativo = EstadoOperativo.new
  end

  # GET /estado_operativos/1/edit
  def edit
  end

  # POST /estado_operativos
  # POST /estado_operativos.json
  def create
    @estado_operativo = EstadoOperativo.new(estado_operativo_params)

    respond_to do |format|
      if @estado_operativo.save
        format.html { redirect_to @estado_operativo, notice: 'Tipo dato was successfully created.' }
        format.json { render :show, status: :created, location: @estado_operativo }
      else
        format.html { render :new }
        format.json { render json: @estado_operativo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_operativos/1
  # PATCH/PUT /estado_operativos/1.json
  def update
    respond_to do |format|
      if @estado_operativo.update(estado_operativo_params)
        format.html { redirect_to @estado_operativo, notice: 'Tipo dato was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_operativo }
      else
        format.html { render :edit }
        format.json { render json: @estado_operativo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_operativos/1
  # DELETE /estado_operativos/1.json
  def destroy
    @estado_operativo.destroy
    respond_to do |format|
      format.html { redirect_to estado_operativos_url, notice: 'Estado operativo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_operativo
      @estado_operativo = EstadoOperativo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_operativo_params
      params.require(:estado_operativo).permit(:clave_status, :status)
    end

end
