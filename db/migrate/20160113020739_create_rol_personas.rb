class CreateRolPersonas < ActiveRecord::Migration
  def change
    create_table :rol_personas do |t|
      t.string :rol_persona, limit: 32

      t.timestamps null: false
    end
    add_index :rol_personas, :rol_persona, unique: true
  end
end
