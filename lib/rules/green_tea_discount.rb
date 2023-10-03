# frozen_string_literal: true

module Rules
  module GreenTeaDiscount
    module_function

    def apply(cart_items)
      green_teas = cart_items.select { |item| item.code == 'GR1' }
      return if green_teas.empty? || green_teas.size == 1

      free_teas = green_teas.count / 2
      free_teas.times do
        cart_items.delete_at(cart_items.index(green_teas.first))
      end
      cart_items.sum(&:price)
    end
  end
end
