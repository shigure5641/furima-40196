require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品が出来るとき' do
      it 'name,describe,category_id,status_id,shipping_cost_id,prefecture_id
           shipping_day_id,product_priceが存在していれば商品を出品できる' do
        expect(@product).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'imageが空の場合､出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空の場合､出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'describeが空の場合､出品できない' do
        @product.describe = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Describe can't be blank")
      end

      it 'category_idが1の場合､出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idが1の場合､出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it 'shipping_cost_idが1の場合､出品できない' do
        @product.shipping_cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it 'prefecture_idが1の場合､出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_day_idが1の場合､出品ができない' do
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'product_priceが空白の場合､出品できない' do
        @product.product_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price can't be blank", 'Product price is not a number')
      end

      it 'product_priceの金額が300未満の場合､出品できない' do
        @product.product_price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Product price must be greater than or equal to 300')
      end

      it 'product_priceの金額が9_999_999を超えた場合､出品できない' do
        @product.product_price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Product price must be less than or equal to 9999999')
      end

      it 'product_priceが全角数字の場合､出品できない' do
        @product.product_price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Product price is not a number')
      end

      it 'product_priceが全角文字の場合､出品できない' do
        @product.product_price = 'サンプル'
        @product.valid?
        expect(@product.errors.full_messages).to include('Product price is not a number')
      end

      it 'product_priceが半角文字の場合､出品できない' do
        @product.product_price = 'ｻﾝﾌﾟﾙ'
        @product.valid?
        expect(@product.errors.full_messages).to include('Product price is not a number')
      end

      it 'product_priceの金額に小数点が含まれる場合､出品できない' do
        @product.product_price = 300.00
        @product.valid?
        expect(@product.errors.full_messages).to include('Product price must be an integer')
      end

      it 'userが紐づけられていない場合､出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
