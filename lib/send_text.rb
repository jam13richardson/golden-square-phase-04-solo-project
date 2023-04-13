require "twilio-ruby"

class SendText
  def initialize(order_confirmation, client=Twilio::REST::Client)
    @order_confirmation = order_confirmation
    @client = client
  end

  def twilio_api(customer_number, body)
    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]
    client = @client.new(account_sid, auth_token)

    client.messages.create(
    from: "+447778888888",
    to: customer_number,
    body: body
    )
  end 
  
  def send_text(customer_number)
    twilio_api(customer_number, @order_confirmation.message)
    "Sent: #{@order_confirmation.message}"
  end
end