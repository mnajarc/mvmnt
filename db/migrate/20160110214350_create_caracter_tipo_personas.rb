class CreateCaracterTipoPersonas < ActiveRecord::Migration
  def change
    create_table :caracter_tipo_personas do |t|
      t.string :caracteristica, limit: 48
      t.boolean :requerido
      t.belongs_to :tipo_dato, index: true, foreign_key: true
      t.belongs_to :tipo_persona, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
