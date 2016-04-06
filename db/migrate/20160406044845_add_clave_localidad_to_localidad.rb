class AddClaveLocalidadToLocalidad < ActiveRecord::Migration
  def change
    add_column :localidads, :clave_localidad, :string, limit: 3
    add_index :localidads, [:estado_id, :clave_localidad], unique: true
  end
end
