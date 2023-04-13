require 'menu'

RSpec.describe Menu do 
 
    it "adds a dish to the menu" do 
        dish = double :dish
        menu1 = Menu.new
        menu1.add(dish)
        expect(menu1.list).to eq ([dish])
    end

    it "removes dish from the menu" do 
        dish = double :dish
        menu1 = Menu.new
        menu1.add(dish)
        menu1.remove(dish)
        expect(menu1.list).to eq([])
    end

    it "if not previously added dish, returns an error" do
        dish = double :dish
        dish2 = double :dish2
        dish3 = double :dish3
        menu1 = Menu.new
        menu1.add(dish)
        menu1.add(dish2)
        expect { menu1.remove(dish3) }.to raise_error("Error dish not found")
      end

    it "returns menu as a list" do
        dish = double :dish
        dish2 = double :dish2
        dish3 = double :dish3
        menu1 = Menu.new
        menu1.add(dish)
        menu1.add(dish2)
        menu1.add(dish3)
        expect(menu1.list).to eq ([dish, dish2, dish3])
    end
end