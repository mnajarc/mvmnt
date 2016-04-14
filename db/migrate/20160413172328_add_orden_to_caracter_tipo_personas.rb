class AddOrdenToCaracterTipoPersonas < ActiveRecord::Migration
  def change
    add_column :caracter_tipo_personas, :orden, :decimal, precision: 5, scale:2
    add_index :caracter_tipo_personas, [:tipo_persona_id, :orden], :unique => true
  end
end
