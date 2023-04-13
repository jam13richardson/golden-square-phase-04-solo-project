class Receipt
    def initialize(order) # order is an instance of Order
      @order = order
    end

    def total # returns the total price of the order.
      if @order.list.empty?
        fail "Error: Order does not exist"
      else @order.list.inject(0) { 
        |sum, dish| 
        sum + dish.price 
      }
      end
    end

    def itemised
      if @order.list.empty?
        fail "Error: Order does not exist"
      else 
        itemised = "-- Receipt -- \n"
        @order.list.each do |dish|
       itemised += "-- #{dish.name}: £%.2f -- \n" % [dish.price]
      end
      itemised += "-- Total: £%.2f --" % [total]
    end
    end
  end