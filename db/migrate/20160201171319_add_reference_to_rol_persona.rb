class AddReferenceToRolPersona < ActiveRecord::Migration
  def change
    add_reference :rol_personas, :tipo_persona, index: true, foreign_key: true
  end
end
