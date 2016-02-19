class AddIndexToPersonasCaracteres < ActiveRecord::Migration
  def change
    add_index :personas, :rol_caracteres, using: :gin
    add_index :personas, :tipo_caracteres, using: :gin
  end
end
