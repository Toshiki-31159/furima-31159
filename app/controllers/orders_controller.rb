class OrdersController < ApplicationController
before_action :item_params
before_action :sold_out_item
before_action :authenticate_user!
before_action :user_check

  def index
    @order = ItemOrder.new
  end

  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(
      :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(
        user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    unless @item.purchase_record.nil?
      redirect_to root_path
    end
  end

  def user_check
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end