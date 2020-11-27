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
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :cost_beaver_id, :shipment_area_id, :preparation_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
