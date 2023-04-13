require 'receipt'

RSpec.describe Receipt do 
    it "returns the total price of an order" do
        dish1 = double :dish, name: "dish", price: 3
        dish2 = double :dish, name: "another dish", price: 5
        dish3 = double :dish, name: "oh and one more dish", price: 6
        order1 = double :order, list: [dish1, dish2, dish3]
        receipt1 = Receipt.new(order1)
        expect(receipt1.total).to eq(14)
    end

    it "returns error if order is empty" do 
        order1 = double :order, list: []
        receipt1 = Receipt.new(order1)
        expect { receipt1.total }.to raise_error("Error: Order does not exist")
    end

    it "returns an itemised list with a total" do 
        dish1 = double :dish, name: "dish", price: 3
        dish2 = double :dish, name: "another_dish", price: 5
        dish3 = double :dish, name: "oh_and_one_more_dish", price: 6
        order1 = double :order, list: [dish1, dish2, dish3]
        receipt1 = Receipt.new(order1)
        expect(receipt1.itemised).to eq("-- Receipt -- \n-- dish: £3.00 -- \n-- another_dish: £5.00 -- \n-- oh_and_one_more_dish: £6.00 -- \n-- Total: £14.00 --")
    end

    it "returns an error if itemised list is empty" do 
        order1 = double :order, list: []
        receipt1 = Receipt.new(order1)
        expect { receipt1.itemised }.to raise_error("Error: Order does not exist")
    end
end