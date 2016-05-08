class CaracteristicaTipoAlmacen < ActiveRecord::Base
  belongs_to :tipo_dato
  belongs_to :tipo_almacen
end
