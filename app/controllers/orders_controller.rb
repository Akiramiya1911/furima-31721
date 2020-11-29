class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    @buyer_data = BuyerData.new
  end

  def create
    @buyer_data = BuyerData.new(buyer_data_params)
    @buyer_data.save
    if @buyer_data.valid?
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def buyer_data_params
    params.require(:buyer_data).permit(:card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
