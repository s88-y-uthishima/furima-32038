class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item 
  before_action :move_to_index

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(set_params)
    if @order_form.valid?  
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end 
  end

  private
  def set_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :address_line, :building, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: set_params[:token],
      currency: 'jpy'
      
      
    )
  end
end
