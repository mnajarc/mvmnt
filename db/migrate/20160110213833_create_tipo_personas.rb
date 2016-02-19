class CreateTipoPersonas < ActiveRecord::Migration
  def change
    create_table :tipo_personas do |t|
      t.string :tipo_persona

      t.timestamps null: false
    end
    add_index :tipo_personas, :tipo_persona, unique: true
  end
end
