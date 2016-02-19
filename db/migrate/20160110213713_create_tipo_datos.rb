class CreateTipoDatos < ActiveRecord::Migration
  def change
    create_table :tipo_datos do |t|
      t.string :tipo_dato
      t.string :dataprot

      t.timestamps null: false
    end
    add_index :tipo_datos, :tipo_dato, unique: true
  end
end
