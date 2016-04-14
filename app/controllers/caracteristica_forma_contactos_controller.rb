class CaracteristicaFormaContactosController < ApplicationController
before_filter :authenticate_usuario!
  before_action :set_caracteristica_forma_contacto, only: [:show, :edit, :update, :destroy]

  # GET /caracteristica_forma_contactos
  # GET /caracteristica_forma_contactos.json
  def index
    @caracteristica_forma_contactos = CaracteristicaFormaContacto.all
  end

  # GET /caracteristica_forma_contactos/1
  # GET /caracteristica_forma_contactos/1.json
  def show
  end

  # GET /caracteristica_forma_contactos/new
  def new
    @forma_contactos = FormaContacto.all
    @tipo_datos = TipoDato.all
    @caracteristica_forma_contacto = CaracteristicaFormaContacto.new
  end

  # GET /caracteristica_forma_contactos/1/edit
  def edit
    @forma_contactos = FormaContacto.all
    @tipo_datos = TipoDato.all

  end

  # POST /caracteristica_forma_contactos
  # POST /caracteristica_forma_contactos.json
  def create
    @caracteristica_forma_contacto = CaracteristicaFormaContacto.new(caracteristica_forma_contacto_params)

    respond_to do |format|
      if @caracteristica_forma_contacto.save
        format.html { redirect_to @caracteristica_forma_contacto, notice: 'Caracteristica Forma Contacto was successfully created.' }
        format.json { render :show, status: :created, location: @caracteristica_forma_contacto }
      else
        format.html { render :new }
        format.json { render json: @caracteristica_forma_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caracteristica_forma_contactos/1
  # PATCH/PUT /caracteristica_forma_contactos/1.json
  def update
    respond_to do |format|
      if @caracteristica_forma_contacto.update(caracteristica_forma_contacto_params)
        format.html { redirect_to @caracteristica_forma_contacto, notice: 'Caracteristica Forma Contacto was successfully updated.' }
        format.json { render :show, status: :ok, location: @caracteristica_forma_contacto }
      else
        format.html { render :edit }
        format.json { render json: @caracteristica_forma_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caracteristica_forma_contactos/1
  # DELETE /caracteristica_forma_contactos/1.json
  def destroy
    @caracteristica_forma_contacto.destroy
    respond_to do |format|
      format.html { redirect_to caracteristica_forma_contactos_url, notice: 'Caracteristica tForma Contacto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caracteristica_forma_contacto
      @caracteristica_forma_contacto = CaracteristicaFormaContacto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caracteristica_forma_contacto_params
      params.require(:caracteristica_forma_contacto).permit(:caracteristica, :requerido, :tipo_dato_id, :forma_contacto_id, :orden)
    end

end
