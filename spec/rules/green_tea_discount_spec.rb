# frozen_string_literal: true

RSpec.describe Rules::GreenTeaDiscount do
  describe '.apply' do
    let(:green_tea) { Product.new('GR1', 'Green tea', 3.11) }

    it 'returns nil' do
      cart_items = [Product.new('SR1', 'Strawberries', 5.00)]
      expect(Rules::GreenTeaDiscount.apply(cart_items)).to be_nil
    end

    it 'returns nil' do
      cart_items = [green_tea]
      expect(Rules::GreenTeaDiscount.apply(cart_items)).to be_nil
    end

    it 'applies the green tea discount and return discount value' do
      cart_items = [green_tea, green_tea]
      expect(Rules::GreenTeaDiscount.apply(cart_items)).to eq 3.11
    end

    it 'applies more green tea discounts and return discount value' do
      cart_items = [green_tea, green_tea, green_tea]
      expect(Rules::GreenTeaDiscount.apply(cart_items)).to eq 6.22
    end
  end
end
