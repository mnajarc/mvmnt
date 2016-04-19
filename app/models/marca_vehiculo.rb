class MarcaVehiculo < ActiveRecord::Base
  validates :clave_marca_vehiculo, uniqueness: true, presence:true
  has_many :modelo_vehiculos
  has_many :tipo_vehiculos, through: :modelo_vehiculos

  accepts_nested_attributes_for :modelo_vehiculos, allow_destroy: true
  
private
  
  def modelo_vehiculos_ltvi
    ModeloVehiculo.where("tipo_vehiculo_id = ? and marca_vehiculo_id =?",$tipo_vehiculo_id, self.id)
  end


end
