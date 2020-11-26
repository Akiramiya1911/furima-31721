class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_of_ship_id, :item_price).merge(user_id: current_user.id)
  end
end
