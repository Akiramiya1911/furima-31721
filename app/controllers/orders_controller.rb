class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :authenticate_user!, only: :create

  def index
    @item_purchase = @item.item_purchase
    if @item_purchase
      redirect_to root_path
    elsif not user_signed_in?
      redirect_to new_user_session_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
    @buyer_data = BuyerData.new
  end

  def create
    @buyer_data = BuyerData.new(buyer_data_params)
    binding.pry
    if @buyer_data.valid?
      pay_item
      @buyer_data.save
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
    params.require(:buyer_data).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(token: params[:token],user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: buyer_data_params[:token],
      currency: 'jpy'
    )
  end
end
