class AddCaracteresToPersonas < ActiveRecord::Migration
  def change
    add_column :personas, :rol_caracteres, :hstore
    add_column :personas, :tipo_caracteres, :hstore
  end
end
