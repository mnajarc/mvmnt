class CaracterTipoPersonasController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_caracter_tipo_persona, only: [:show, :edit, :update, :destroy]

  # GET /caracter_tipo_personas
  # GET /caracter_tipo_personas.json
  def index
    @caracter_tipo_personas = CaracterTipoPersona.all
  end

  # GET /caracter_tipo_personas/1
  # GET /caracter_tipo_personas/1.json
  def show
  end

  # GET /caracter_tipo_personas/new
  def new
    @tipo_personas = TipoPersona.all
    @tipo_datos = TipoDato.all
    @caracter_tipo_persona = CaracterTipoPersona.new
  end

  # GET /caracter_tipo_personas/1/edit
  def edit
    @tipo_personas = TipoPersona.all
    @tipo_datos = TipoDato.all

  end

  # POST /caracter_tipo_personas
  # POST /caracter_tipo_personas.json
  def create
    @caracter_tipo_persona = CaracterTipoPersona.new(caracter_tipo_persona_params)

    respond_to do |format|
      if @caracter_tipo_persona.save
        format.html { redirect_to @caracter_tipo_persona, notice: 'Caracter tipo persona was successfully created.' }
        format.json { render :show, status: :created, location: @caracter_tipo_persona }
      else
        format.html { render :new }
        format.json { render json: @caracter_tipo_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caracter_tipo_personas/1
  # PATCH/PUT /caracter_tipo_personas/1.json
  def update
    respond_to do |format|
      if @caracter_tipo_persona.update(caracter_tipo_persona_params)
        format.html { redirect_to @caracter_tipo_persona, notice: 'Caracter tipo persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @caracter_tipo_persona }
      else
        format.html { render :edit }
        format.json { render json: @caracter_tipo_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caracter_tipo_personas/1
  # DELETE /caracter_tipo_personas/1.json
  def destroy
    @caracter_tipo_persona.destroy
    respond_to do |format|
      format.html { redirect_to caracter_tipo_personas_url, notice: 'Caracter tipo persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caracter_tipo_persona
      @caracter_tipo_persona = CaracterTipoPersona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caracter_tipo_persona_params
      params.require(:caracter_tipo_persona).permit(:caracteristica, :requerido, :tipo_dato_id, :tipo_persona_id)
    end
end
