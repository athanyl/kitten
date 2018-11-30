class CartController < ApplicationController
    before_action :require_login

    def create_cart
        confirm_check = (Cart.all[current_user.id - 1] != nil) ? true : false
        if confirm_check == true
            @user_cart = Cart.all[current_user.id - 1]
        end
        
        if confirm_check == false
            @new_cart = Cart.new
            @new_cart.user = current_user
            @new_cart.save
        end
    end

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
            redirect_to '/cart', notice: "Kitten added to cart"
        else
            redirect_to '/', alert: "Please, register !"
        end
    end

    def show
        cart = Cart.find(current_user.id)
        @items = cart.items
    end

    def destroy
        @cart = Cart.find(current_user.id)
        @item = @cart.items.delete(params[:item_id])
    end

private

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end

end