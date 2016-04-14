class AddOrdenToCaracteristicaTipoVehiculos < ActiveRecord::Migration
  def change
    add_column :caracteristica_tipo_vehiculos, :orden, :decimal, precision: 5, scale:2
    add_index :caracteristica_tipo_vehiculos, [:tipo_vehiculo_id, :orden], :unique => true, :name => "tipovehiculo_orden_idx"
  end
end
