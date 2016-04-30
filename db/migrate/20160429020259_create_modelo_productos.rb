class CreateModeloProductos < ActiveRecord::Migration
  def change
    create_table :modelo_productos do |t|
      t.string :clave_modelo, limit: 20
      t.string :nombre_modelo, limit: 50
      t.belongs_to :marca_producto, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :modelo_productos, :clave_modelo, unique: true
  end
end
