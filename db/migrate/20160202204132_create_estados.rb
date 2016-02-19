class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nombre_estado
      t.belongs_to :nacion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
