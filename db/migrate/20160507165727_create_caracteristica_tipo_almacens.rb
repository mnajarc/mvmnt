class CreateCaracteristicaTipoAlmacens < ActiveRecord::Migration
  def change
    create_table :caracteristica_tipo_almacens do |t|
      t.string :caracteristica, limit: 48
      t.boolean :requerido
      t.decimal :orden, precision: 5, scale:2
      t.belongs_to :tipo_dato, index: true, foreign_key: true
      t.belongs_to :tipo_almacen, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
