require 'order'

RSpec.describe Order do 

    it "adds dish to an order" do 
        menu1 = double :menu 
        dish1 = double :dish, name: "dish", price: 3
        order1 = Order.new(menu1)
        order1.select(dish1)
        expect(order1.list).to eq ([dish1])
    end

    it "removes dish from an order" do 
        menu1 = double :menu 
        dish1 = double :dish, name: "dish", price: 3
        dish2 = double :dish, name: "another dish", price: 5
        order1 = Order.new(menu1)
        order1.select(dish1)
        order1.select(dish2)
        order1.remove(dish1)
        expect(order1.list).to eq ([dish2])
    end

    it "if not previously added, dish not found in order" do 
        menu1 = double :menu 
        dish1 = double :dish, name: "dish", price: 3
        dish2 = double :dish, name: "another dish", price: 5
        dish3 = double :dish, name: "oh and one more dish", price: 6
        order1 = Order.new(menu1)
        order1.select(dish1)
        order1.select(dish2)
        expect { order1.remove(dish3) }.to raise_error("Error dish not found")
    end

    it "returns order list" do
        dish = double :dish
        dish1 = double :dish1
        dish2 = double :dish2
        dish3 = double :dish3
        menu = double :menu
        order = Order.new(menu)
        allow(order).to receive(:list).and_return([dish, dish1, dish2, dish3])
        expect(order.list).to eq([dish, dish1, dish2, dish3])
      end
end