# frozen_string_literal: true

RSpec.describe Cart do
  describe '#initialize' do
    it 'creates an empty cart' do
      cart = Cart.new

      expect(cart.items).to be_empty
    end
  end

  describe '#add_items' do
    it 'adds an item to the cart' do
      cart = Cart.new
      item = 'Green Tea'
      cart.add_items(item)

      expect(cart.items).to include(item)
    end
  end
end
