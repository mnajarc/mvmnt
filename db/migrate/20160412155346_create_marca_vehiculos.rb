class CreateMarcaVehiculos < ActiveRecord::Migration
  def change
    create_table :marca_vehiculos do |t|
      t.string :clave_marca_vehiculo, limit: 20
      t.string :marca_vehiculo

      t.timestamps null: false
    end
    add_index :marca_vehiculos, :clave_marca_vehiculo, unique: true
  end
end
