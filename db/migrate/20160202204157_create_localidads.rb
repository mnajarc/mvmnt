class CreateLocalidads < ActiveRecord::Migration
  def change
    create_table :localidads do |t|
      t.string :nombre_localidad
      t.belongs_to :estado, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
