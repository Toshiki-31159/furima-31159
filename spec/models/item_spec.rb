require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品がうまくいく場合' do
      it "全ての欄が正しく埋まっていれば登録できる" do
        expect(@item).to be_valid
      end
      it "価格が300なら登録できる" do
        @item.price = "300"
        expect(@item).to be_valid
      end
      it "価格が9999999なら登録できる" do
        @item.price = "9999999"
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかない場合' do
      it "画像が選択されていない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が記入されていない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が記入されていない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーのidが1の場合" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の情報のidが1の場合" do
        @item.item_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end
      it "配送料の負担のidが1の場合" do
        @item.delivery_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it "発送元の地域のidが1の場合" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送までの日数のidが1の場合" do
        @item.sipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping day must be other than 1")
      end
      it "価格が記入されていない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が300未満" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "価格が10000000以上" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "価格が全角数字で記入されている" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end
