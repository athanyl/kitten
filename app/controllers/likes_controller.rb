class LikesController < ApplicationController
    before_action :find_item
    before_action :require_login

   def create
    if already_liked?
        item = Item.find(params[:item_id])
        redirect_to '/', alert: "You already like that ! Price still #{item.price} for #{item.likes.count} likes"
    else
     new_like = Like.new
     new_like.user = current_user
     item = Item.find(params[:item_id])
     new_like.item_id = item.id
     new_like.save
     redirect_to '/', notice: "Like has been added !" 
    end
   end
   private
    def find_item
        @item = Item.find(params[:item_id])
    end
    def require_login
        unless current_user
        redirect_to new_user_session_path
        end
    end
    def already_liked?
        Like.where(user_id: current_user.id, item_id:
        params[:item_id]).exists?
    end
 end