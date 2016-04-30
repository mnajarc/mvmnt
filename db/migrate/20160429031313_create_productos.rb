class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :sku, limit: 20
      t.string :nombre_producto, limit: 50
      t.decimal :precio
      t.hstore :caracteristicas
      t.belongs_to :marca_producto, index: true, foreign_key: true
      t.belongs_to :modelo_producto, index: true, foreign_key: true
      t.belongs_to :tipo_producto, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :productos, :sku, unique: true
  end
end
