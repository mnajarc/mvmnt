class CaracteristicaTipoProducto < ActiveRecord::Base
  belongs_to :tipo_dato
  belongs_to :tipo_producto
end
