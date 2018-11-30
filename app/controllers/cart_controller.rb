class CartController < ApplicationController
    before_action :require_login

    def update
        if current_user
            item = Item.find(params[:id])
            @cart = Cart.find(current_user.id)
            @cart.items << item
            redirect_to '/', notice: "Kitten added to cart"
        else
            redirect_to '/', alert: "Please, register !"
        end
    end

    def update_from_cart
        if current_user
            item = Item.find(params[:id])
            @cart = Cart.find(current_user.id)
            @cart.items << item
            redirect_to '/cart'
        else
            redirect_to '/', alert: "Please, register !"
        end
    end

    def update_less_from_cart
        if current_user
            item = Item.find(params[:id])
            @cart = Cart.find(current_user.id)
            @cart.items.delete(item)
            redirect_to '/cart'
        else
            redirect_to '/', alert: "Please, register !"
        end
    end

    def show
        cart = Cart.find(current_user.id)
        @items = cart.items
    end

private

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end

end