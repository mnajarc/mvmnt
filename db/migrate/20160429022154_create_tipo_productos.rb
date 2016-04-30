class CreateTipoProductos < ActiveRecord::Migration
  def change
    create_table :tipo_productos do |t|
      t.string :clave_tipo_producto, limit: 20
      t.string :nombre_tipo_producto, limit: 50

      t.timestamps null: false
    end
    add_index :tipo_productos, :clave_tipo_producto, unique: true
  end
end
