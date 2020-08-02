require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/price_calculator"

class BillingMachineTest < Minitest::Test
  def test_total
    expected = 19.02
    assert_equal(expected,BillingMachine.new({"milk"=>3, "bread"=>4, "banana"=>1, "apple"=>1}).show_total)
  end

  def test_amount_saved
    expected = 3.45
    assert_equal(expected,BillingMachine.new({"milk"=>3, "bread"=>4, "banana"=>1, "apple"=>1}).show_saved_amount)
  end

end
