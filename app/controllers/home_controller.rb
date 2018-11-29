class HomeController < ApplicationController
  def index
    @items = Item.order(price: :desc).all
  end
end
