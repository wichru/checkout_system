# frozen_string_literal: true

require 'csv'
require 'tty-prompt'
require_relative 'environment'

# Load products from CSV
products = {}
CSV.foreach('data/products.csv', headers: true) do |row|
  code = row['ProductCode']
  products[code] = Product.new(code, row['Name'], row['Price'].to_f)
end

cart = Cart.new
prompt = TTY::Prompt.new

loop do # rubocop:disable Metrics/BlockLength
  # Clear screen for better visibility each loop iteration
  system('clear')

  # Main Menu
  choice = prompt.select(
    'Choose an option:', ['Show available products', 'Add item to cart', 'Show your cart', 'Exit']
  )

  case choice
  when 'Show available products'
    puts 'Available Products:'
    products.each do |code, product|
      puts "#{code}: #{product.name} - #{product.price} €"
    end

  when 'Add item to cart'
    product_code = prompt.select('Choose a product:', products.keys + [:back])

    next if product_code == :back

    cart.add_items(products[product_code])
    puts "#{products[product_code].name} added to the cart."

  when 'Show your cart'
    if cart.items.empty?
      puts 'Your cart is empty.'
    else
      puts 'Your Cart:'
      cart.items.group_by(&:code).each do |code, items|
        puts "#{code}: #{items.first.name} x#{items.count}"
      end

      # Calculate total price with discounts applied
      pricing_service = PricingService.new(cart.items)
      total_price = pricing_service.total_price

      puts "Total price with discounts applied: #{total_price}€"
    end

  when 'Exit'
    break
  end

  prompt.keypress('Press any key to continue...')
end
