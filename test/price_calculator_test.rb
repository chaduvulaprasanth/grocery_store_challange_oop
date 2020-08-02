require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/price_calculator"

class BillingMachineTest < Minitest::Test
  def test_billing_machine_receipt
    expected = puts 
      " +--------+----------+-------+
      | Item   | Quantity | Price |
      +--------+----------+-------+
      | milk   | 3        | 8.97  |
      | bread  | 4        | 8.17  |
      | banana | 1        | 0.99  |
      | apple  | 1        | 0.89  |
      +--------+----------+-------+ \n Total price : $19.02 \n You saved $3.45 today"
    assert_equal(expected, BillingMachine.checkout({"milk"=>3, "bread"=>4, "banana"=>1, "apple"=>1}))
  end

  def test_total
    expected = 19.02
    assert_equal(expected,BillingMachine.new({"milk"=>3, "bread"=>4, "banana"=>1, "apple"=>1}).show_total)
  end

  def test_amount_saved
    expected = 3.45
    assert_equal(expected,BillingMachine.new({"milk"=>3, "bread"=>4, "banana"=>1, "apple"=>1}).show_saved_amount)
  end

  def test_recipt_table
    expected = puts
    " +--------+----------+-------+
      | Item   | Quantity | Price |
      +--------+----------+-------+
      | milk   | 3        | 8.97  |
      | bread  | 4        | 8.17  |
      | banana | 1        | 0.99  |
      | apple  | 1        | 0.89  |
      +--------+----------+-------+"

    assert_equal(expected,BillingMachine.new({"milk"=>3, "bread"=>4, "banana"=>1, "apple"=>1}).show_recipt_table)
  end
end
