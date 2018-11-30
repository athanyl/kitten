class HomeController < ApplicationController
  def index
    @items = Item.all
  end

  def profil
    redirect_to '/profil', alert: "Please register to show profil !" if current_user == nil
  end

  def users
    redirect_to new_user_registration_path
  end

  def about
  end
end
