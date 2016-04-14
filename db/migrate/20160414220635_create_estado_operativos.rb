class CreateEstadoOperativos < ActiveRecord::Migration
  def change
    create_table :estado_operativos do |t|
      t.string :clave_status, limit: 2
      t.string :status

      t.timestamps null: false
    end
    add_index :estado_operativos, :clave_status, unique: true
  end
end
