require 'menu'
require 'dish'
require 'order'
require 'receipt'
require 'order_confirmation'

RSpec.describe "integration" do 
    it "adds new dish to menu list" do 
        dish1 = Dish.new("pizza", 8)
        dish2 = Dish.new("pudding", 8)
        dish3 = Dish.new("curry", 9)
        dish4 = Dish.new("salad", 6)
        menu = Menu.new
        menu.add(dish1)
        menu.add(dish2)
        menu.add(dish3)
        menu.add(dish4)
        expect(menu.list).to eq([dish1, dish2, dish3, dish4])
    end

    it "removes a dish from the menu list" do
        dish1 = Dish.new("pizza", 8)
        dish2 = Dish.new("pudding", 8)
        dish3 = Dish.new("curry", 9)
        dish4 = Dish.new("salad", 6)
        menu = Menu.new
        menu.add(dish1)
        menu.add(dish2)
        menu.add(dish3)
        menu.add(dish4)
        menu.remove(dish1)
        expect(menu.list).to eq([dish2, dish3, dish4])
    end
end 


