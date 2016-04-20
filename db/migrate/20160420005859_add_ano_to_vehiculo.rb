class AddAnoToVehiculo < ActiveRecord::Migration
  def change
    add_column :vehiculos, :ano_vehiculo, :integer
  end
end
