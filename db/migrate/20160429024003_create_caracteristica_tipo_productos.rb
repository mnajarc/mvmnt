class CreateCaracteristicaTipoProductos < ActiveRecord::Migration
  def change
    create_table :caracteristica_tipo_productos do |t|
      t.string :caracteristica, limit: 48
      t.boolean :requerido
      t.decimal :orden, precision: 5, scale:2
      t.belongs_to :tipo_dato, index: true, foreign_key: true
      t.belongs_to :tipo_producto, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :caracteristica_tipo_productos, [:tipo_producto_id, :orden], unique: true, :name => "tipoproducto_orden_idx"
  end
end
