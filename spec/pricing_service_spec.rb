# frozen_string_literal: true

RSpec.describe PricingService do
  describe '#total_price' do
    it 'returns 0' do
      pricing_service = PricingService.new([])
      expect(pricing_service.total_price).to eq 0
    end

    context 'when there are items in the cart' do
      let(:green_tea) { Product.new('GR1', 'Green tea', 3.11) }
      let(:strawberries) { Product.new('SR1', 'Strawberries', 5.00) }
      let(:coffee) { Product.new('CF1', 'Coffee', 11.23) }

      it 'returns the total price of the items in the cart' do
        cart_items = [green_tea, strawberries, coffee]
        pricing_service = PricingService.new(cart_items)
        expect(pricing_service.total_price).to eq 19.34
      end

      it 'applies the strawberries discount and returns the total price' do
        cart_items = [strawberries, strawberries, strawberries]
        pricing_service = PricingService.new(cart_items)
        expect(pricing_service.total_price).to eq 13.50
      end

      it 'applies the discount and returns the total price' do
        cart_items = [green_tea, green_tea]
        pricing_service = PricingService.new(cart_items)
        expect(pricing_service.total_price).to eq 3.11
      end

      it 'applies only one discount' do
        cart_items = [strawberries, strawberries, green_tea, strawberries]
        pricing_service = PricingService.new(cart_items)
        expect(pricing_service.total_price).to eq 16.61
      end

      it 'applies coffee test data' do
        cart_items = [green_tea, coffee, strawberries, coffee, coffee]
        pricing_service = PricingService.new(cart_items)
        expect(pricing_service.total_price).to eq 30.57
      end
    end
  end
end
