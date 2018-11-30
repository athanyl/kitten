class HomeController < ApplicationController
  def index
    @items = Item.all
  end

  def users
    redirect_to new_user_registration_path
  end

  def about
  end

  def mail
  end
end
