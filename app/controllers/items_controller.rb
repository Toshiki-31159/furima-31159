class ItemsController < ApplicationController

  def index
    @items = Item.order(id: :DESC)
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to  new_user_session_path
    end 
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == item.user_id
      item.destroy
      redirect_to root_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(
      :image, :name, :description, :category_id, :item_status_id, :delivery_charge_id, :prefecture_id, :sipping_day_id, :price).merge(user_id: current_user.id)
  end
end
