class CartController < ApplicationController
    def new
        check = Cart.all
        confirm_check = (check[current_user.id - 1].items[0] != nil) ? true : false
        if confirm_check == true
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
        cart = current_user.cart
        @items = cart.items
    end

    def destroy
        @cart = current_user.cart
        @item = @cart.items.delete(params[:item_id])
    end
end
