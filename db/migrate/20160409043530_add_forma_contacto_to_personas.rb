class AddFormaContactoToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :forma_contactos, :hstore
  end
end
