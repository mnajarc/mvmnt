class TipoAlmacen < ActiveRecord::Base
  has_many :caracteristica_tipo_almacens, -> { order(:orden) }
  accepts_nested_attributes_for :caracteristica_tipo_almacens, allow_destroy: true
end
