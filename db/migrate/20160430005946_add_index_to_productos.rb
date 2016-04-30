class AddIndexToProductos < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :productos do |cam|
        dir.up {execute "create index productos_caracteristicas on productos using GIN(caracteristicas)"}
        dir.down {execute "drop index productos_caracteristicas"}
      end
    end
  end
end