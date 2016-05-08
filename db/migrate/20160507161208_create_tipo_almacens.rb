class CreateTipoAlmacens < ActiveRecord::Migration
  def change
    create_table :tipo_almacens do |t|
      t.string :clave_tipo_almacen, limit: 20
      t.string :nombre_tipo_almacen, limit: 40

      t.timestamps null: false
    end
    add_index :tipo_almacens, :clave_tipo_almacen, unique: true
  end
end
