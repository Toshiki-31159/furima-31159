class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :sipping_day_id
    validates :price, format: {with: /\A[0-9]+\z/}
  end
end
