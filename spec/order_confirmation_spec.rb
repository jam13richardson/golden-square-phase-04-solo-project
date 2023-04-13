require 'order_confirmation'

RSpec.describe OrderConfirmation do
  let(:order) { double(:order) }
  let(:time) { Time.new(2022, 03, 18, 19, 30) }
  subject(:order_confirmation) { OrderConfirmation.new(order, time) }

  it "returns order and order time" do
    expect(order_confirmation.order).to eq(order)
    expect(order_confirmation.time).to eq(time)
  end

  it "returns time for delivery" do
    expect(order_confirmation.delivery_time(40)).to eq(Time.new(2022, 03, 18, 19, 50))
  end

  it "returns a message for order placed and delivery time" do
    order_confirmation.delivery_time(40)
    expect(order_confirmation.message).to eq("Thank you! Your order was placed and will be delivered before 19:50")
    order_confirmation.delivery_time(50)
    expect(order_confirmation.message).to eq("Thank you! Your order was placed and will be delivered before 19:55")
  end
end