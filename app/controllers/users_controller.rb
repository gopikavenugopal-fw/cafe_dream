class UsersController < ApplicationController

    skip_before_action :ensure_user_logged_in
    def new 
        render "users/new"
    end

    def create
        user = User.create!(
            name: params[:name],
            email: params[:email],
            phone: params[:phone],
            password: params[:password]
        )

        session[:current_user_id] = user.id
        redirect_to "/"
    end

end