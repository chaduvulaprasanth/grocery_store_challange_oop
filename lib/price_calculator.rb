require_relative "billing"
require_relative "cart"

cart = Cart.new()
order = cart.enter_order
puts order