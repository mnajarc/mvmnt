class UnidadsController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_unidad, only: [:show, :edit, :update, :destroy]
  # GET /tipo_personas
  # GET /tipo_personas.json
  def index
    @unidads = Unidad.all
  end

  # GET /tipo_personas/1
  # GET /tipo_personas/1.json
  def show
  end

  # GET /tipo_personas/new
  def new
    @unidad = Unidad.new
  end

  # GET /tipo_personas/1/edit
  def edit
  end

  # POST /tipo_personas
  # POST /tipo_personas.json
  def create
    @unidad = Unidad.new(unidad_params)

    respond_to do |format|
      if @unidad.save
        format.html { redirect_to @unidad, notice: 'Unidad was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_persona }
      else
        format.html { render :new }
        format.json { render json: @unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_personas/1
  # PATCH/PUT /tipo_personas/1.json
  def update
    respond_to do |format|
      if @unidad.update(unidad_params)
        format.html { redirect_to @unidad, notice: 'Unidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @unidad }
      else
        format.html { render :edit }
        format.json { render json: @unidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_personas/1
  # DELETE /tipo_personas/1.json
  def destroy
    @unidad.destroy
    respond_to do |format|
      format.html { redirect_to tipo_personas_url, notice: 'Unidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidad
      @unidad = Unidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unidad_params
      params.require(:unidad).permit(:codigo, :unidad)
    end
end
