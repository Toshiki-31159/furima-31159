class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sipping_day

  with_options presence: true do
    validates :name, :description, :image
    validates :price, format: {with: /\A[3-9][0-9]{2}|[1-9][0-9]{3,6}\z/}
  end
  with_options presence: true, numericality: {other_than: 1} do
    validates :category_id, :item_status_id, :delivery_charge_id,
              :prefecture_id, :sipping_day_id
  end
end
