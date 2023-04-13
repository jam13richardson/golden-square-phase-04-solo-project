require "send_text"

RSpec.describe SendText do
  let(:client) { double(:client) }
  let(:order_confirmation) { double(:order_confirmation, message: "Thank you! Your order was placed and will be delivered before 20:10") }
  subject(:message) { SendText.new(order_confirmation, client) }

  it "send customer confirmation for their order" do
    expect(client).to receive(:new).with(ENV["account_sid"], ENV["auth_token"]).and_return(double_1 = double(:double_1))
    expect(double_1).to receive(:messages).and_return(double_2 = double(:double_2))
    expect(double_2).to receive(:create).with({ from: "+447778888888",
    to: "+447778888555", body: "Thank you! Your order was placed and will be delivered before 20:10"})
    expect(message.send_text("+447778888555")).to eq("Sent: Thank you! Your order was placed and will be delivered before 20:10")
  end

  it "send customer confirmation for their order" do
    expect(client).to receive(:new).with(ENV["account_sid"], ENV["auth_token"]).and_return(double_1 = double(:double_1))
    expect(double_1).to receive(:messages).and_return(double_2 = double(:double_2))
    expect(double_2).to receive(:create).with({ from: "+447778888888",
    to: "+447778888555", body: "Thank you! Your order was placed and will be delivered before 20:10"})
    expect(message.send_text("+447778888555")).to eq("Sent: Thank you! Your order was placed and will be delivered before 20:10")
  end
end