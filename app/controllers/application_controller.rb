class ApplicationController < ActionController::Base

    before_action :ensure_user_logged_in

    before_action :current_cart

    def ensure_user_logged_in
        unless current_user 
            redirect_to "/"
        end
    end

    def current_user
        return @current_user if @current_user

        current_user_id = session[:current_user_id]
        if current_user_id
            @current_user = User.find(current_user_id)

        else
            nil
        end
    end

    def current_cart
        @current_cart ||= MenuCart.new(token: cart_token)

    end
    helper_method :current_cart

    private

    def cart_token
        return @cart_token unless @cart_token.nil?

        session[:cart_token] ||= SecureRandom.hex(8)
        @cart_token = session[:cart_token]
    end
end
