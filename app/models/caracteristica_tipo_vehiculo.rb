class CaracteristicaTipoVehiculo < ActiveRecord::Base
  belongs_to :tipo_dato
  belongs_to :tipo_vehiculo
end
