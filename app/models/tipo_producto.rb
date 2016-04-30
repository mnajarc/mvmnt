class TipoProducto < ActiveRecord::Base
  has_many :productos
  has_many :modelo_productos, through: :productos
  has_many :marca_productos, through: :productos
  has_many :caracteristica_tipo_productos, -> { order(:orden) }
  validates :clave_tipo_producto, uniqueness: true, presence:true, length: {in: 1..6}
  accepts_nested_attributes_for :caracteristica_tipo_productos, allow_destroy: true
end