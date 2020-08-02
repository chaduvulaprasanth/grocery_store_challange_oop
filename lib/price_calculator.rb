require_relative "price_table"

class OrderEntry
  attr_reader :item_names, :order

  def initialize
    @order = Hash.new(0)
    @item_names = Pricetable::ITEMNAMES
  end

  def enter_order
    puts "Please enter all the items purchased separated by a comma"
    items = gets.chomp
    receive_order(items)
  end

  def receive_order(items)
    items = items.downcase.split(",")
    items.each { |item| item.strip! }
    check_order(items)
  end

  def check_order(items)
    if items.empty? 
      puts 'No items entered'
      abort
    else
      sort_order(items)
    end
  end

  def sort_order(items)
    items.select{ |item| @order[item] += 1 if item_names.include?(item)}
  end
end

OrderEntry.new.enter_order
