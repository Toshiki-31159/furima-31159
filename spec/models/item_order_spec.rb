require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    order_user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:item_order, user_id: order_user, item_id: item)
  end

  describe '商品の購入' do
    context '商品の購入がうまくいくとき' do
      it "全ての情報が正しく入力されていれば登録できる" do
        expect(@order).to be_valid
      end
      it "建物名は空でも登録できる" do
        @order.building_name = ""
        expect(@order).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it "郵便番号が空の場合登録できない" do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it "郵便番号に-がない場合登録できない" do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it "郵便番号の桁が足りないがない場合登録できない" do
        @order.postal_code = "123-456"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end
      it "都道府県が選択されていない場合登録できない" do
        @order.prefecture_id = "1"
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村が空の場合登録できない" do
        @order.municipality = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空の場合登録できない" do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空の場合登録できない" do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it "電話番号に-がある場合登録できない" do
        @order.phone_number = "000-1234-5678"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号の桁が足りない場合登録できない" do
        @order.phone_number = "0123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it "クレジットのトークンが空の場合登録できない" do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end