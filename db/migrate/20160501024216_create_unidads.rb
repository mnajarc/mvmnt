class CreateUnidads < ActiveRecord::Migration
  def change
    create_table :unidads do |t|
      t.string :codigo, limit: 10
      t.string :unidad

      t.timestamps null: false
    end
    add_index :unidads, :codigo, unique: true
  end
end
