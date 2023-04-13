class OrderConfirmation
  attr_reader :order, :time

  def initialize(order, time)
    @order = order
    @time = time
  end

  def delivery_time(mins)
    @delivery_estimate = @time + mins * 30
  end

  def message
    "Thank you! Your order will be delivered by #{@delivery_estimate.strftime("%H:%M")}"
  end
end