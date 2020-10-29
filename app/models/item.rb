class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :item_status, :delivery_charge,
                         :prefecture, :sipping_day

  with_options presence: true do
    validates :name, :description
    validates :price, format: {with: /\A[0-9]+\z/}
  end
  with_options presence: true, numericality: {other_than: 1} do
    validates :category_id, :item_status_id, :delivery_charge_id,
              :prefecture_id, :sipping_day_id
  end
end
