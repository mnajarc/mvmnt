class CreateTipoVehiculos < ActiveRecord::Migration
  def change
    create_table :tipo_vehiculos do |t|
      t.string :clave_tipo_vehiculo, limit: 6
      t.string :tipo_vehiculo

      t.timestamps null: false
    end
    add_index :tipo_vehiculos, :clave_tipo_vehiculo, unique: true
  end
end
