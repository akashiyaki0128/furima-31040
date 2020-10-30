class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :item_owner
  
  def index
    @order = UserOrder.new
  end
  
  
  def create
    @order = UserOrder.new(order_params)
    # binding.pry
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #テスト用の秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  
end
# - クレジットカード決済ができること
# - クレジットカードの情報は購入の都度入力させること
# - クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと
# - ログイン・ログアウトの状態に関わらず、URLを直接入力して売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移すること

# - ログアウト状態のユーザーが商品購入ページに遷移しようとすると、ログインページに遷移すること
# - ログイン状態の出品者が、URLを直接入力して自身の出品した商品購入ページに遷移しようとすると、トップページに遷移すること
# - 配送先の住所情報も購入の都度入力させること
# - 配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
# - 郵便番号にはハイフンが必要であること（123-4567となる）
# - 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）
# - 購入が完了したら、トップページまたは購入完了ページに遷移すること
# - エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）
# - 入力に問題がある状態で購入ボタンが押されたら、購入ページに戻りエラーメッセージが表示されること