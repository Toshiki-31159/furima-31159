class OrdersController < ApplicationController
  def index
    @order = ItemOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      @order.save
      binding.pry
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end