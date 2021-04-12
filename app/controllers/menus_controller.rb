class MenusController < ApplicationController

    

    def index
        @menus = Menu.all
    end

    def show
        @menus = Menu.find_by(params[:menu_id])
    end 

    def edit
        @menus = Menu.find_by(params[:menu_id])
        render "menu_edit", locals: {menu: menu}
        
    end

    def create
        menu = Menu.create!(
            name: params[:name],
            description: params[:description],
            price: params[:price],
        )

        
        redirect_to menus_path
    end
    
    
    def destroy
        @menus = Menu.find_by(params[:menu_id])
        @menus.destroy

        redirect_to menus_path
        
    end

    
    
end