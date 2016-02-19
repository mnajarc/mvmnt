class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  # GET /personas
  # GET /personas.json
  def index
    @tipo_personas = TipoPersona.all
    @rol_personas = RolPersona.all
    if params[:search]
      @personas = Persona.search(params[:search]).order("created_at DESC")
    else
      @personas = Persona.all.order('created_at DESC')
    end
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
  end

  # GET /personas/new
  def new
    @tipo_persona = TipoPersona.find(params[:tipo_persona_id])
    @rol_persona = RolPersona.find(params[:rol_persona_id])
    @persona = Persona.new(tipo_persona_id: params[:tipo_persona_id],rol_persona_id: params[:rol_persona_id])
  end

  # GET /personas/1/edit
  def edit
    @tipo_persona = TipoPersona.find(@persona.tipo_persona_id)
    @rol_persona = RolPersona.find(@persona.rol_persona_id)
  end

  # POST /personas
  # POST /personas.json
  def create
    @tipo_personas = TipoPersona.all
    @rol_personas = RolPersona.all
    @persona = Persona.new(persona_params)

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'Persona was successfully created.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'Persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:nombre_persona, :identificador, :tipo_persona_id, :rol_persona_id, :_destroy, tipo_caracteres: params[:persona][:tipo_caracteres].try(:keys), rol_caracteres: params[:persona][:rol_caracteres].try(:keys))
    end
end
