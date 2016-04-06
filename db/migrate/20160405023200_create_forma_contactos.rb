class CreateFormaContactos < ActiveRecord::Migration
  def change
    create_table :forma_contactos do |t|
      t.string :clave_forma_contacto, limit: 12
      t.string :forma_contacto, limit: 48

      t.timestamps null: false
    end
    add_index :forma_contactos, :clave_forma_contacto, unique: true
    add_index :forma_contactos, :forma_contacto, unique: true
  end
end
