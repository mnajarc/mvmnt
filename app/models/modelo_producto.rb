class ModeloProducto < ActiveRecord::Base
  belongs_to :marca_producto
  has_many :productos

end
