class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :item_owner
  before_action :sold_out
  def index
    @order = UserOrder.new
  end
  
  
  def create
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.saved
      redirect_to root_path
    else
      render action: :index
    end
    
  end
  
  
  private
  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone_number).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
  end
  
  def item_owner
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def sold_out
    if @item.order
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #テスト用の秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
