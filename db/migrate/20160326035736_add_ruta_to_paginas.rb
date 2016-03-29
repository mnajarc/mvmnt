class AddRutaToPaginas < ActiveRecord::Migration
  def change
    add_column :paginas, :ruta, :string
  end
end
