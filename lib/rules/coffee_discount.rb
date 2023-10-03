# frozen_string_literal: true

module Rules
  module CoffeeDiscount
    module_function

    def apply(cart)
      coffee_products = cart.select { |product| product.code == 'CF1' }
      return unless coffee_products.count >= 3

      coffee_products.map { |coffee| coffee.price * 1 / 3 }.sum.round(2)
    end
  end
end
