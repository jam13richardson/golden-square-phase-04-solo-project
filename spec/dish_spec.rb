require 'dish'

RSpec.describe Dish do 
    it "returns the name of the dish" do 
    dish1 = Dish.new("pizza", 8)
    expect(dish1.name).to eq "pizza"
end 

it "returns price of dish" do 
    dish1 = Dish.new("pizza", 8)
    expect(dish1.price).to eq 8
end
end 