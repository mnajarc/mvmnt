class CreateVehiculos < ActiveRecord::Migration
  def change
    create_table :vehiculos do |t|
      t.string :serie
      t.string :placas, limit: 12
      t.hstore :caracteristicas
      t.belongs_to :persona, index: true, foreign_key: true
      t.belongs_to :tipo_vehiculo, index: true, foreign_key: true
      t.belongs_to :marca_vehiculo, index: true, foreign_key: true
      t.belongs_to :modelo_vehiculo, index: true, foreign_key: true
      t.belongs_to :estado_operativo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
