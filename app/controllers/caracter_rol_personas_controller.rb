class CaracterRolPersonasController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_caracter_rol_persona, only: [:show, :edit, :update, :destroy]

  # GET /caracter_rol_personas
  # GET /caracter_rol_personas.json
  def index
    @caracter_rol_personas = CaracterRolPersona.all
  end

  # GET /caracter_rol_personas/1
  # GET /caracter_rol_personas/1.json
  def show
  end

  # GET /caracter_rol_personas/new
  def new
    @rol_personas = RolPersona.all
    @tipo_datos = TipoDato.all
    @caracter_rol_persona = CaracterRolPersona.new
  end

  # GET /caracter_rol_personas/1/edit
  def edit
    @rol_personas = RolPersona.all
    @tipo_datos = TipoDato.all
  end

  # POST /caracter_rol_personas
  # POST /caracter_rol_personas.json
  def create
    @caracter_rol_persona = CaracterRolPersona.new(caracter_rol_persona_params)

    respond_to do |format|
      if @caracter_rol_persona.save
        format.html { redirect_to @caracter_rol_persona, notice: 'Caracter rol persona was successfully created.' }
        format.json { render :show, status: :created, location: @caracter_rol_persona }
      else
        format.html { render :new }
        format.json { render json: @caracter_rol_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caracter_rol_personas/1
  # PATCH/PUT /caracter_rol_personas/1.json
  def update
    respond_to do |format|
      if @caracter_rol_persona.update(caracter_rol_persona_params)
        format.html { redirect_to @caracter_rol_persona, notice: 'Caracter rol persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @caracter_rol_persona }
      else
        format.html { render :edit }
        format.json { render json: @caracter_rol_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caracter_rol_personas/1
  # DELETE /caracter_rol_personas/1.json
  def destroy
    @caracter_rol_persona.destroy
    respond_to do |format|
      format.html { redirect_to caracter_rol_personas_url, notice: 'Caracter rol persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caracter_rol_persona
      @caracter_rol_persona = CaracterRolPersona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caracter_rol_persona_params
      params.require(:caracter_rol_persona).permit(:caracteristica, :requerido, :rol_persona_id, :tipo_dato_id)
    end
end
