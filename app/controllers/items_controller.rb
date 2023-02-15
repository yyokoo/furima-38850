class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    @item.save
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, shipping_cost_id, :shipping_day_id, :prefecture_id, :price).marge(user_id: current_user.id)  
  end
end

