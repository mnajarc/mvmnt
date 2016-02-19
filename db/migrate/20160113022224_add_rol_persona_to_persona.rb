class AddRolPersonaToPersona < ActiveRecord::Migration
  def change
    add_reference :personas, :rol_persona, index: true, foreign_key: true
  end
end
