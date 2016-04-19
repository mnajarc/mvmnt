class Vehiculo < ActiveRecord::Base
  belongs_to :persona
  belongs_to :tipo_vehiculo
  belongs_to :modelo_vehiculo
  belongs_to :marca_vehiculo
  belongs_to :estado_operativo
  has_many :caracteristica_tipo_vehiculos, -> { order(:orden) }
  # cuando se usa un hstore se usa storeaccessor
  store_accessor :caracteristicas

  validate :valida_caracteristica_tipo_vehiculo

  def valida_caracteristica_tipo_vehiculo
    tipo_vehiculo=TipoVehiculo.find($tipo_vehiculo_id)
    tipo_vehiculo.caracteristica_tipo_vehiculos.each do |campo|
      if campo.requerido? && caracteristicas[campo.caracteristica].blank?
        errors.add campo.caracteristica, ' no puede estar en blanco'
      end
    end
  end
  
  
  def self.search(search)
    if search
      self.where('placas ilike ?', "%#{search}%")
    else
      self.all
    end
  end
end
