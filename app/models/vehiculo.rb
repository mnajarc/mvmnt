class Vehiculo < ActiveRecord::Base
  belongs_to :persona
  belongs_to :tipo_vehiculo
  belongs_to :marca_vehiculo
  belongs_to :modelo_vehiculo
  belongs_to :estado_operativo
end
