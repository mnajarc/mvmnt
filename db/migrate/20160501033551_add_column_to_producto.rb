class AddColumnToProducto < ActiveRecord::Migration
  def change
    add_reference :productos, :unidad, index: true, foreign_key: true
  end
end
