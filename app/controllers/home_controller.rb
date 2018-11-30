class HomeController < ApplicationController
  def index
    @items = Item.all
  end

  def users
    redirect_to new_user_registration_path
  end

  def about
  end

  def show
    redirect_to '/', alert: "Please register to show profil !" if current_user == nil
  end

end
