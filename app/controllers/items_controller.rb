class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_current_user, only: :edit

  def index
    @items = Item.order("created_at desc")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :note, :category_id, :condition_id, :postage_player_id, :prefecture_id, :handling_time_id, :image, :price).merge(user_id: current_user.id)
  end

  def ensure_current_user
    @item = Item.find(params[:id])
    @user = @item.user_id
    if current_user.id != @user
      redirect_to root_path
    end
  end
  
end