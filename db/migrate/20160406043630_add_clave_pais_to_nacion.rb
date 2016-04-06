class AddClavePaisToNacion < ActiveRecord::Migration
  def change
    add_column :nacions, :clave_pais, :string, limit: 3
    add_index :nacions, :clave_pais, unique: true
  end
end
