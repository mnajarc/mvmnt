class AddClaveEstadoToEstado < ActiveRecord::Migration
  def change
    add_column :estados, :clave_estado, :string, limit: 3
    add_index :estados, [:nacion_id, :clave_estado], unique: true
  end
end
