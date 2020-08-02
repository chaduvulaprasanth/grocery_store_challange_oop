require_relative "price_table"
require 'terminal-table/import'

class OrderEntry
  attr_reader :item_names, :order, :calculator

  def initialize(calculator)
    @order = Hash.new(0)
    @item_names = Pricetable::ITEMNAMES
    @calculator = calculator
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
    calculator.checkout(order)
  end
end

class BillingMachine 
  attr_reader :total, :menu, :order, :amount_saved, :reciept_table, :item, :quantity, :price, :sale_qun, :sale_price, :items_price

  def initialize(order)
    @total = 0
    @menu = Pricetable::MENU
    @order = order
    @amount_saved = 0
    @reciept_table = []
    @item = nil,
    @quantity = nil,
    @price = nil,
    @sale_qun = nil,
    @sale_price = nil
    @items_price = nil
  end

  def self.checkout(order)
    new(order).checkout
  end

  def checkout
    order.each{ |item, quantity| item_in_sale(item, quantity) }
    reciept
  end

  def item_in_sale(item,quantity)
    menu.each do |menu_item| 
      if menu_item["name"] == item
        @item = item
        @quantity = quantity
        @price = menu_item["price"]
        @sale_qun = menu_item["sale_qun"]
        @sale_price = menu_item["sale_price"] 
        billing
      end
    end
  end

  def billing
    sale_qun && quantity >= sale_qun ? discount_billing : normal_billing
  end

  def discount_billing
    price_of_simliar_item_in_sale
    cal_saved_amount
  end

  def normal_billing
    price_of_simliar_item
  end

  def price_of_simliar_item_in_sale
    @items_price = sale_price + (price * (quantity - sale_qun))
    common_job
  end

  def price_of_simliar_item
    @items_price = quantity * price
    common_job
  end

  def common_job
    add_to_reciept_table
    add_total
  end

  def add_total
    @total += items_price
  end

  def cal_saved_amount
    @amount_saved += ((sale_qun * price) - sale_price)
  end

  def add_to_reciept_table
    @reciept_table << [item, quantity, items_price]
  end

  def generate_reciept_table
    items_table = table { |t|
      t.headings = "Item", "Quantity", "Price"
      reciept_table.each { |row| t << row }
    }
  end

  def reciept
    puts" #{generate_reciept_table} \n 
    Total price : $#{total.round(2)} \n 
    You saved $#{amount_saved.round(2)} today"
  end

  # for testing total, saved amount and recipt table
  def show_total
    checkout
    total.round(2)
  end

  def show_saved_amount
    checkout
    amount_saved.round(2)
  end

  def show_recipt_table
    checkout
    puts" #{generate_reciept_table}"
  end
end


# OrderEntry.new(BillingMachine).enter_order
