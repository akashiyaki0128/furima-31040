class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @item = Item.all
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

  private

  def item_params
    params.require(:item).permit(:name, :note, :category_id, :condition_id, :postage_player_id, :prefecture_id, :handling_time_id, :image, :price).merge(user_id: current_user.id)
  end
end
