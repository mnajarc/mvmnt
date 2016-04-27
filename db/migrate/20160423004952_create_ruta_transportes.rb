class CreateRutaTransportes < ActiveRecord::Migration
  def change
    create_table :ruta_transportes do |t|
      t.string :clave_ruta, limit: 10
      t.string :nombre_ruta, limit: 50
      t.decimal :kilometraje, precision: 8, scale: 3

      t.timestamps null: false
    end
  end
end
