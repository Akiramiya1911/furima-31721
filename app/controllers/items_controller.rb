class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    binding.pry
    if @item.valid?
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_of_ship_id, :item_price).merge(user_id: current_user.id)
  end

end
