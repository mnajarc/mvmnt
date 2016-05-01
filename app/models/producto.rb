class Producto < ActiveRecord::Base
  belongs_to :marca_producto
  belongs_to :modelo_producto
  belongs_to :tipo_producto
  belongs_to :unidad
end
