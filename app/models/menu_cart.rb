class MenuCart 

    delegate :subtotal, to: :order

     def initialize(token:)
         @token = token
     end
     
     def order
        @order ||= Order.find_or_create_by(token: @token, status: 'cart') do |order|
            order.subtotal = 0
        end
     end

     def items_count
        order.items.sum(:quantity)
     end

     def add_item(menu_id:, quantity:)
        menu = Menu.find(menu_id)

        order_item = order.items.find_or_initialize_by(
            menu_id: menu_id
        )
        order_item.price = menu.price
        order_item.quantity = quantity

        ActiveRecord::Base.transaction do
            order_item.save
            update_subtotal!

        end

        

     end

     def remove_item(id:)
        ActiveRecord::Base.transaction do
            order.items.destroy(id)
            update_subtotal!

        end

        
     end

     def update_subtotal!
        order.subtotal = order.items.sum('quantity * price')
        order.save
     end 
end