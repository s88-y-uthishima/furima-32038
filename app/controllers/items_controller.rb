class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
    @item = Item.create
  end
end
