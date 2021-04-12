class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, :precision => 15, :scale =>2

      t.timestamps
    end
  end
end
