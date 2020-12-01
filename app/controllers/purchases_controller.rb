class PurchasesController < ApplicationController

  def index
    @purchases = Purchases.all  
  end

  def create
    @purchase = OrderForm.new(set_params)
    @purchase.save 
  end

  private
  def set_params
    params.permit(:user_id, :item_id, :post_code, :prefecture_id, :city, :address_line, :building, :phone_number)
  end
end
