class CreatePaginas < ActiveRecord::Migration
  def change
    create_table :paginas do |t|
      t.string :nombre
      t.text :contenido
      t.string :ancestry

      t.timestamps null: false
    end
    add_index :paginas, :ancestry
  end
end
