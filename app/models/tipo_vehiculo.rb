class TipoVehiculo < ActiveRecord::Base
  validates :clave_tipo_vehiculo, uniqueness: true, presence:true, length: {in: 1..6}
  has_many :caracteristica_tipo_vehiculos, -> { order(:orden) }
  has_many :modelo_vehiculos
  accepts_nested_attributes_for :caracteristica_tipo_vehiculos, allow_destroy: true
end
