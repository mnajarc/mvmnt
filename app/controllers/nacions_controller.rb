class NacionsController < ApplicationController
  before_filter :authenticate_usuario!
  before_action :set_nacion, only: [:show, :edit, :update, :destroy]

  # GET /nacions
  # GET /nacions.json
  def index
    @nacions = Nacion.all
  end

  # GET /nacions/1
  # GET /nacions/1.json
  def show
  end

  # GET /nacions/new
  def new
    @nacion = Nacion.new
  end

  # GET /nacions/1/edit
  def edit
  end

  # POST /nacions
  # POST /nacions.json
  def create
    @nacion = Nacion.new(nacion_params)

    respond_to do |format|
      if @nacion.save
        format.html { redirect_to @nacion, notice: 'Nacion was successfully created.' }
        format.json { render :show, status: :created, location: @nacion }
      else
        format.html { render :new }
        format.json { render json: @nacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nacions/1
  # PATCH/PUT /nacions/1.json
  def update
    respond_to do |format|
      if @nacion.update(nacion_params)
        format.html { redirect_to @nacion, notice: 'Nacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @nacion }
      else
        format.html { render :edit }
        format.json { render json: @nacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nacions/1
  # DELETE /nacions/1.json
  def destroy
    @nacion.destroy
    respond_to do |format|
      format.html { redirect_to nacions_url, notice: 'Nacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nacion
      @nacion = Nacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nacion_params
      params.require(:nacion).permit(:clave_pais, :nombre, estados_attributes: [:id, :clave_estado, :nombre_estado, :nacion_id, :_destroy, localidads_attributes: [:id, :clave_localidad, :nombre_localidad, :estado_id, :_destroy]])
    end
end
