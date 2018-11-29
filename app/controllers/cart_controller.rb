class CartController < ApplicationController
    def new
        @cart = Cart.new
        @cart.user = current_user
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
