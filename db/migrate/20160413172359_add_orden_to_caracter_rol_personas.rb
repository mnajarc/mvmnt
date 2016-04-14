class AddOrdenToCaracterRolPersonas < ActiveRecord::Migration
  def change
    add_column :caracter_rol_personas, :orden, :decimal, precision: 5, scale:2
    add_index :caracter_rol_personas, [:rol_persona_id, :orden], :unique => true
  end
end
