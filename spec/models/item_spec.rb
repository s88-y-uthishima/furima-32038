require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全ての情報があれば出品できる" do
      expect(@item).to be_valid
    end

    it "画像がないと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名がないと出品できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品説明がないと出品できない" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "カテゴリーが0以外を選択されていないと出品できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "状態が0以外を選択されていないと出品できない" do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 0")
    end
    it "配送料負担が0以外を選択されていないと出品できない" do
      @item.cost_beaver_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost beaver must be other than 0")
    end
    it "発送元が0以外を選択されていないと出品できない" do
      @item.shipment_area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment area must be other than 0")
    end
    it "発送までの日数が0以外を選択されていないと出品できない" do
      @item.preparation_days_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation days must be other than 0")
    end
    it "価格が入力されていないと出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格が正常範囲内でないと出品できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it "価格が半角数字で入力されていないと出品できない" do
      @item.price = "５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end  
end
