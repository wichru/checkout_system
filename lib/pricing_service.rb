# frozen_string_literal: true

class PricingService
  attr_reader :cart_items, :rules

  def initialize(cart_items)
    @cart_items = cart_items
    @rules = [Rules::GreenTeaDiscount, Rules::StrawberryDiscount, Rules::CoffeeDiscount]
  end

  def total_price = (original_prices - discounts).round(2)

  private

  def original_prices = cart_items.sum(&:price).round(2)
  def discounts = rules.map { |rule| rule.apply(cart_items) }.compact.sum
end
