class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :cost_beaver_id, :shipment_area_id, :preparation_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
