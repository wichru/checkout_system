# frozen_string_literal: true

RSpec.describe Rules::CoffeeDiscount do
  describe '.apply' do
    it 'returns nil' do
      cart = [Product.new('AP1', 'Almond', 5.00)]
      expect(Rules::CoffeeDiscount.apply(cart)).to be_nil
    end

    it 'applies a discount of 1/3 of the price of each coffee product' do
      cart = [
        Product.new('CF1', 'Coffee', 11.23),
        Product.new('CF1', 'Coffee', 11.23),
        Product.new('CF1', 'Coffee', 11.23)
      ]
      expect(Rules::CoffeeDiscount.apply(cart)).to eq 11.23
    end

    it 'applies a discount of 1/3 of the price of each coffee product' do
      cart = [
        Product.new('CF1', 'Coffee', 11.23),
        Product.new('CF1', 'Coffee', 11.23),
        Product.new('CF1', 'Coffee', 11.23),
        Product.new('CF1', 'Coffee', 11.23),
        Product.new('CF1', 'Coffee', 11.23)
      ]
      expect(Rules::CoffeeDiscount.apply(cart)).to eq 18.72
    end
  end
end
