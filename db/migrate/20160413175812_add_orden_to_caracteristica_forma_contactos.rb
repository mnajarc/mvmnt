class AddOrdenToCaracteristicaFormaContactos < ActiveRecord::Migration
  def change
    add_column :caracteristica_forma_contactos, :orden, :decimal, precision: 5, scale:2
    add_index :caracteristica_forma_contactos, [:forma_contacto_id, :orden], :unique => true, :name => "formacontacto_orden_idx"
  end
end
