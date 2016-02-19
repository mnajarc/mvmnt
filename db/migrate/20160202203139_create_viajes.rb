class CreateViajes < ActiveRecord::Migration
  def change
    create_table :viajes do |t|
      t.string :origen
      t.string :destino
      t.integer :distancia
      t.decimal :combustible
      t.decimal :Peaje
      t.decimal :gasto_extra

      t.timestamps null: false
    end
  end
end
