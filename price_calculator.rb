require_relative "./lib/billing"
require_relative "./lib/cart"

cart = Cart.new()
order = cart.enter_order
bill = BillingMachine.new(order)
bill.checkout
bill.reciept