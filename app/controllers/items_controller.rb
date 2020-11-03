class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.order(id: :DESC)
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
      if current_user.id != @item.user_id
        redirect_to root_path
      end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
        redirect_to item_path
    else
        render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :image, :name, :description, :category_id, :item_status_id, :delivery_charge_id, :prefecture_id, :sipping_day_id, :price).merge(user_id: current_user.id)
  end
end
