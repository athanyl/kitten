class CartController < ApplicationController
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

    def edit
        @item = Item.find(params[:item_id])
        @cart = current_user.cart
        @cart.item << @item
    end

    def show
        create_cart
        cart = current_user.cart
        @items = cart.items
    end

    def destroy
        @cart = current_user.cart
        @item = @cart.items.delete(params[:item_id])
    end
end
