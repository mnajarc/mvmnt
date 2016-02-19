class CreateNacions < ActiveRecord::Migration
  def change
    create_table :nacions do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
