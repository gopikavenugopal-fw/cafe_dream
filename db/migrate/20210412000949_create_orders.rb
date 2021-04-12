class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name, null: true
      t.decimal :subtotal, :precision => 15, :scale => 2

      t.timestamps
    end
  end
end
