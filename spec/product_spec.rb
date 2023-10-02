# frozen_string_literal: true

RSpec.describe Product do
  describe '#initialize' do
    it 'creates a new product with a code, name, and price' do
      product = Product.new('GR1', 'Green Tea', 3.11)
      expect(product.code).to eq('GR1')
      expect(product.name).to eq('Green Tea')
      expect(product.price).to eq(3.11)
    end
  end
end
