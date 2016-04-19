class TipoVehiculo < ActiveRecord::Base
  has_many :marca_vehiculos, through: :modelo_vehiculos
  has_many :caracteristica_tipo_vehiculos, -> { order(:orden) }
  has_many :modelo_vehiculos
  has_many :vehiculos
  validates :clave_tipo_vehiculo, uniqueness: true, presence:true, length: {in: 1..6}

  accepts_nested_attributes_for :caracteristica_tipo_vehiculos, allow_destroy: true
end
