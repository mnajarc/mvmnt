class MarcaVehiculo < ActiveRecord::Base
  validates :clave_marca_vehiculo, uniqueness: true, presence:true
  has_many :modelo_vehiculos
  accepts_nested_attributes_for :modelo_vehiculos, allow_destroy: true
end
