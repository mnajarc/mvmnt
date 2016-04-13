class ModeloVehiculo < ActiveRecord::Base
  belongs_to :marca_vehiculo
  belongs_to :tipo_vehiculo
  validates :clave_modelo_vehiculo, uniqueness: true, presence:true
end
