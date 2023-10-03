# frozen_string_literal: true

module Rules
  module StrawberryDiscount
    module_function

    def apply(cart_items)
      strawberries = cart_items.select { |item| item.code == 'SR1' }
      return unless (items_size = strawberries.size) >= 3

      original_price = strawberries.first.price
      (original_price - 4.50) * items_size
    end
  end
end
