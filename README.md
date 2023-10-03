# Cash Register System

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Welcome to the Cash Register System! This application serves as a simple point of sale system, allowing users to add products to a cart and compute the total price with special discount rules applied.

## Features

1. **Product Listing**: Displays available products along with their prices.
2. **Cart Management**: Allows users to add products to their cart and view the cart contents.
3. **Dynamic Pricing**: Offers special discount rules based on the product combinations in the cart.

### Tech

Cash Register System is built with the following technologies:

* [Ruby 3.2.1]
* [RSpec] - Rspec tests
* [Guard && Guard-RSpec] - autotest for rspec
* [Rubocop] - Ruby static code analyzer
* [TTY::Prompt] - independent prompt component for TTY toolkit

### Setup and Installation

To set up the Cash Register System on your local machine:

```sh
$ cd checkout_system
$ bundle install
```

### Running Script

```sh
$ cd checkout_system
$ ruby cli.rb
```

### Tests && code coverage

```sh
$ cd checkout_system
$ rspec spec
$ open coverage/index.html
```

### Guard
```sh
$ cd ruby_app
$ guard --clear
```

### Usage

Upon starting the application, you will be presented with a menu:

1. **Show available products**: Displays the list of products available for purchase.
2. **Add item to cart**: Allows you to select a product to add to your cart.
3. **Show your cart**: Displays the contents of your cart along with the total price, considering any discounts.
4. **Exit**: Closes the application.

### Discounts & Pricing Rules
* **Green Tea (GR1)**: Buy-one-get-one-free offer.
* **Strawberries (SR1)**: If you purchase 3 or more strawberries, the price per strawberry drops to 4.50€.
* **Coffee (CF1)**: For 3 or more coffees, the price of each coffee drops to 2/3 of the original price.
