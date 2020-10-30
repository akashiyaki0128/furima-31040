class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,:destroy]
  before_action :ensure_current_user, only: [:edit,:update,:destroy]

  def index
    @items = Item.order('created_at desc')
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

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
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
    redirect_to root_path if current_user.id != @item.user_id
  end
end
