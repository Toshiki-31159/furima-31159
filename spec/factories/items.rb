FactoryBot.define do
  factory :item do
    association :user
    name               {"仮の商品名"}
    description        {"仮の説明を書いて商品を説明しています"}
    price              {"1000"}
    category_id        {"2"}
    item_status_id     {"2"}
    delivery_charge_id {"2"}
    prefecture_id      {"2"}
    sipping_day_id     {"2"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end