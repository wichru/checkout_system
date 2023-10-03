# frozen_string_literal: true

RSpec.describe Rules::StrawberryDiscount do
  describe '.apply' do
    it 'returns nil' do
      items = [
        Product.new('FR1', 'Fruit tea', 3.11),
        Product.new('CF1', 'Coffee', 11.23),
        Product.new('MK1', 'Milk', 4.75)
      ]
      expect(Rules::StrawberryDiscount.apply(items)).to be_nil
    end

    it 'applies the discount to all strawberries' do
      strawberries = [
        Product.new('SR1', 'Strawberries', 5.00),
        Product.new('SR1', 'Strawberries', 5.00),
        Product.new('SR1', 'Strawberries', 5.00)
      ]
      items = [
        Product.new('FR1', 'Fruit tea', 3.11),
        Product.new('CF1', 'Coffee', 11.23),
        Product.new('MK1', 'Milk', 4.75),
        *strawberries
      ]
      expect(Rules::StrawberryDiscount.apply(items)).to eq((5.00 - 4.50) * strawberries.size)
    end
  end
end
