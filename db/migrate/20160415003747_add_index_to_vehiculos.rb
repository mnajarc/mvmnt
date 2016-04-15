class AddIndexToVehiculos < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :vehiculos do |cam|
        dir.up {execute "create index vehiculos_caracteristicas on vehiculos using GIN(caracteristicas)"}
        dir.down {execute "drop index vehiculos_caracteristicas"}
      end
    end
  end
end
