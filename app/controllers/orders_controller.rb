class OrdersController < ApplicationController

    def new 
       @order = current_cart.order
    end

    def create 

       if current_cart.order.update(order_params.merge(status: 'open'))
           session[:cart_token] = nil
           redirect_to menus_path
       else 
           render :new
       end
    end   

    def order_params
       params.require(:order).permit(:name)
    end

end