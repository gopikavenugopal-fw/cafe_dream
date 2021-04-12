class UsersController < ApplicationController

    skip_before_action :ensure_user_logged_in

    def index
        @users = User.all
        
    end
    def new 
        render "users/new"
    end

    def create
        user = User.create!(
            name: params[:name],
            email: params[:email],
            phone: params[:phone],
            password: params[:password],
        )

        session[:current_user_id] = user.id
        redirect_to "/"
    end

    def show
        @users = User.find(params[:id])
    end

    def edit
        @users = current_user
    end

    def update
        respond_to do |format|
            if current_user.update(user_params)
                format.html { redirect_to current_user}
            else
                format.html { render :edit}
            end
        end
    end

    private
    def user_params
        params.require(:user).permit(
            :password,
        )
    end
    
    
    

end