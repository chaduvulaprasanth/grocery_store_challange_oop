require_relative "store"
require_relative "billing"


class Cart
  attr_reader :order, :menu

  def initialize
    @order = Hash.new(0)
    @menu = STORE::MENU
  end

  def enter_order
    puts "Please enter all the items purchased separated by a comma"
    items = gets.chomp
    items = items.downcase.split(",")
    items.each { |item| item.strip! }
    check_order(items)
  end

  private

  def check_order(items)
    if items.empty? 
      puts 'No items entered'
      abort
    else
      sort_order(items)
    end
  end

  def sort_order(items)
    items.select do |item| 
      if menu.each do |menu_item|
          @order[item] += 1 if menu_item["name"] == item
        end
      end
    end
    return order
  end

end


