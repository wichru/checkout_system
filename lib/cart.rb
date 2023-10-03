# frozen_string_literal: true

class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_items(product) = items << product
end
