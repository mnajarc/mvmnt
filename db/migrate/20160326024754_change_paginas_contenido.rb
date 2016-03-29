class ChangePaginasContenido < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :paginas do |t|
        dir.up    {t.change :contenido, :string }
        dir.down    {t.change :contenido, :text }
      end
    end
  end
end
