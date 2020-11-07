FactoryBot.define do
  factory :item_order do
    postal_code   {"123-4567"}
    prefecture_id {"2"}
    municipality  {"市町村"}
    address       {"住所と番地1-2-3"}
    building_name {"建物名マンション名123号室"}
    phone_number  {"12345678910"}
    token         {"credittoken"}
    association :user
    association :item
  end
end
