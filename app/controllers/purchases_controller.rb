class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    # @purchase = Purchase.new
    @purchase = OrderForm.new

  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = OrderForm.new(set_params)
    if @purchase.valid?  
      @purchase.save
      redirect_to root_path
    else
      render :index
    end 
  end

  private
  def set_params
    params.permit(:user_id, :item_id, :post_code, :prefecture_id, :city, :address_line, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
