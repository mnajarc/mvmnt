class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre_persona
      t.string :identificador, limit: 32
      t.belongs_to :tipo_persona, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :personas, :identificador, unique: true
  end
end
