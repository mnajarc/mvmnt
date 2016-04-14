class FormaContactosController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_forma_contacto, only: [:show, :edit, :update, :destroy]
  before_action :set_caracteristica_forma_contactos, only: [:show]

  # GET /forma_contactos
  # GET /forma_contactos.json
  def index
    @forma_contactos = FormaContacto.all
  end

  # GET /forma_contactos/1
  # GET /forma_contactos/1.json
  def show
  end

  # GET /forma_contactos/new
  def new
    @tipo_datos = TipoDato.all
    @forma_contacto = FormaContacto.new
  end

  # GET /forma_contactos/1/edit
  def edit
    @tipo_datos = TipoDato.all
  end

  # POST /forma_contactos
  # POST /forma_contactos.json
  def create
    @forma_contacto = FormaContacto.new(forma_contacto_params)

    respond_to do |format|
      if @forma_contacto.save
        format.html { redirect_to @forma_contacto, notice: 'Forma Contacto was successfully created.' }
        format.json { render :show, status: :created, location: @forma_contacto }
      else
        format.html { render :new }
        format.json { render json: @forma_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forma_contactos/1
  # PATCH/PUT /forma_contactos/1.json
  def update
    respond_to do |format|
      if @forma_contacto.update(forma_contacto_params)
        format.html { redirect_to @forma_contacto, notice: 'Forma Contacto was successfully updated.' }
        format.json { render :show, status: :ok, location: @forma_contacto }
      else
        format.html { render :edit }
        format.json { render json: @forma_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forma_contactos/1
  # DELETE /forma_contactos/1.json
  def destroy
    @forma_contacto.destroy
    respond_to do |format|
      format.html { redirect_to forma_contactos_url, notice: 'Forma Contacto was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forma_contacto
      @forma_contacto = FormaContacto.find(params[:id])
    end

    def set_caracteristica_forma_contactos
      @caracteristica_forma_contactos=CaracteristicaFormaContacto.where(forma_contacto_id: @forma_contacto.id).order(:orden)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forma_contacto_params
      params.require(:forma_contacto).permit(:clave_forma_contacto, :forma_contacto, caracteristica_forma_contactos_attributes: [:id, :caracteristica, :requerido, :tipo_dato_id, :forma_contacto_id, :orden, :_destroy] )
    end

end
