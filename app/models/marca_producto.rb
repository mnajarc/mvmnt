class MarcaProducto < ActiveRecord::Base
  has_many :modelo_productos
  accepts_nested_attributes_for :modelo_productos, allow_destroy: true
end