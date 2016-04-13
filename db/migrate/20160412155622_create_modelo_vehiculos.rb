class CreateModeloVehiculos < ActiveRecord::Migration
  def change
    create_table :modelo_vehiculos do |t|
      t.string :clave_modelo_vehiculo, limit: 20
      t.string :modelo_vehiculo
      t.belongs_to :marca_vehiculo, index: true, foreign_key: true
      t.belongs_to :tipo_vehiculo, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :modelo_vehiculos, :clave_modelo_vehiculo, unique: true
  end
end
