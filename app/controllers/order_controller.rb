class OrderController < ApplicationController
    before_action :require_login

    def create_order
        
        new_order = Order.new
        current_user.cart.items.each do | item |
            new_order.items << item
            new_order.save
        end
        current_user.orders << new_order
        current_user.save
     end

    def show
        redirect_to '/', alert: "Please register to show profil !" if current_user == nil
    end

private

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end
end
