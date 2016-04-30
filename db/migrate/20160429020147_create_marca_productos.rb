class CreateMarcaProductos < ActiveRecord::Migration
  def change
    create_table :marca_productos do |t|
      t.string :clave_marca, limit: 20
      t.string :nombre_marca, limit: 50

      t.timestamps null: false
    end
    add_index :marca_productos, :clave_marca, unique: true
  end
end
