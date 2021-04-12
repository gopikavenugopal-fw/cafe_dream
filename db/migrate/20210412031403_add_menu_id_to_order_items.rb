class AddMenuIdToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :menu_id, :integer
  end
end
