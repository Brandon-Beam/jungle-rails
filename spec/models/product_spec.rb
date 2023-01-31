require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @cat1 = Category.new(name: 'Evergreens', id:5)
    end
    it "validates existence" do
      @product=@cat1.products.new({
        name:  "tree",
        quantity: 7,
        price: 64.99
      })
     
     expect(@product.save).to be(true)
    end
    it "validates name" do
      @product=@cat1.products.new({
        name:  nil,
        quantity: 7,
        price: 64.99
      })
      @product.save
     expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "validates quantity" do
      @product=@cat1.products.new({
        name:  "tree",
        quantity: nil,
        price: 64.99
      })
      @product.save
     expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "validates Category" do
      @product=Product.new({
        name:  "tree",
        quantity: 7,
        price: 64.99
      })
      @product.save
      puts @product.errors.full_messages
     expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it "validates price" do
      @product=@cat1.products.new({
        name:  "tree",
        quantity: 7
      })
      @product.save
      puts @product.errors.full_messages
     expect(@product.errors.full_messages).to include("Price can't be blank")
    end
  end
end