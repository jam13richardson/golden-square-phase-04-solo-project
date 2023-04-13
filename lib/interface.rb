require './lib/menu'
require './lib/dish'
require './lib/order'
require './lib/receipt'
require './lib/order_confirmation'
require './lib/send_text'

class Interface
    def initialize()
      @menu = menu
      @order = Order.new(@menu)
      @receipt = Receipt.new(@order)
    end
  
    def menu # returns the menu.
      puts "-- Menu --"
      @menu.list.each_with_index do |dish, index|
        puts "#{index + 1}. #{dish.name} - £%.2f" % [dish.price]
      end
      puts "-- Menu --"
    end
  
    def order # returns a new order.
      puts "-- New Order --"
      puts "Please enter the number of the dish you would like to order."
      number = gets.chomp
      if number.to_i >= 1 && number.to_i < @menu.list.length
        @order.select(@menu.list[number.to_i - 1])
        puts "You have ordered #{@menu.list[number.to_i - 1].name}"
        puts "Do you want to order another dish? (y/n)"
        answer = gets.chomp
        if answer == "y"
          new_order
        puts "Do you want to remove a dish? (y/n)"
        answer = gets.chomp
        if answer == "y"
          remove_order
        else puts "-- New Order --"
        end
        end
      else
        puts "Error: Dish not found in order"
      end
    end
  
    def number_request # returns a string and ask user to enter phone number.
      puts "Please enter the number of the dish you would like to remove."
      number = gets.chomp
      if number.to_i >= 1 && number.to_i < @order.list.length
        @order.remove(@menu.list[number.to_i - 1])
        puts "You have removed #{@menu.list[number.to_i - 1].name}"
        puts "Do you want to remove another dish? (y/n)"
        answer = gets.chomp
        if answer == "y"
          remove_order
        else puts "-- New Order --"
        end
      end
    end
  
    def print_receipt # prints the receipt.
      puts @receipt.itemised unless @order.list.empty?
    end
  end