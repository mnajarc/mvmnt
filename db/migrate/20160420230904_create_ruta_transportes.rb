class CreateRutaTransportes < ActiveRecord::Migration
  def change
    create_table :ruta_transportes do |t|
      t.string :clave_ruta, limit: 20
      t.string :sentido, limit: 3
      t.localidad :punto_a
      t.localidad :punto_b

      t.timestamps null: false
    end
  end
end
