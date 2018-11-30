class HomeController < ApplicationController
  def index
    @items = Item.all
  end

  def users
    redirect_to new_user_registration_path
  end

  def about
  end

<<<<<<< HEAD
  def mail
  end
=======
  def show
    redirect_to '/', alert: "Please register to show profil !" if current_user == nil
  end

>>>>>>> 80d5ba00653541c0135d47c4a3b88479c380faf0
end
