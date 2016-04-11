class RolPersonasController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_rol_persona, only: [:show, :edit, :update, :destroy]
  before_action :set_caracter_rol_personas, only: [:show]


  # GET /rol_personas
  # GET /rol_personas.json
  def index
    @rol_personas = RolPersona.all
  end

  # GET /rol_personas/1
  # GET /rol_personas/1.json
  def show
  end

  # GET /rol_personas/new
  def new
    @tipo_persona = TipoPersona.find(params[:tipo_persona_id])
    @tipo_datos = TipoDato.all
    @rol_persona = RolPersona.new(tipo_persona_id: params[:tipo_persona_id])
  end

  # GET /rol_personas/1/edit
  def edit
    @tipo_persona = TipoPersona.find(@rol_persona.tipo_persona_id)
    @tipo_datos = TipoDato.all
  end

  # POST /rol_personas
  # POST /rol_personas.json
  def create
    @tipo_personas = TipoPersona.all
    @rol_persona = RolPersona.new(rol_persona_params)

    respond_to do |format|
      if @rol_persona.save
        format.html { redirect_to @rol_persona, notice: 'Rol persona was successfully created.' }
        format.json { render :show, status: :created, location: @rol_persona }
      else
        format.html { render :new }
        format.json { render json: @rol_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rol_personas/1
  # PATCH/PUT /rol_personas/1.json
  def update
    respond_to do |format|
      if @rol_persona.update(rol_persona_params)
        format.html { redirect_to @rol_persona, notice: 'Rol persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @rol_persona }
      else
        format.html { render :edit }
        format.json { render json: @rol_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rol_personas/1
  # DELETE /rol_personas/1.json
  def destroy
    @rol_persona.destroy
    respond_to do |format|
      format.html { redirect_to rol_personas_url, notice: 'Rol persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol_persona
      @rol_persona = RolPersona.find(params[:id])
    end

    def set_caracter_rol_personas
      @caracter_rol_personas=CaracterRolPersona.where(rol_persona_id: @rol_persona.id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def rol_persona_params
      params.require(:rol_persona).permit(:rol_persona, :tipo_persona_id, caracter_rol_personas_attributes: [:id, :caracteristica, :requerido, :tipo_dato_id, :rol_persona_id, :_destroy])
    end
end
