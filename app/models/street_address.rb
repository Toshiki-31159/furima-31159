class StreetAddress < ApplicationRecord
  belongs_to :purchase_record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :municipality, :address
  end
  validates :building_name
end
