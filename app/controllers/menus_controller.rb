class MenusController < ApplicationController
    def index
        @menus = Menu.order(:name)
    end

    def show
        @menus = Menu.find(params[:id])
    end
    
end