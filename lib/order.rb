
class Order
    def initialize(menu) # menu is a string
      @menu = menu 
      @order = []
    end
  
    def select(dish) # dish is a string, adds dish to the order.
      @order << dish
    end
  
    def remove(dish) # dish is a string, removes dish from the order.
      if @order.include?(dish)
        @order.delete(dish)
      else fail "Error dish not found"
      end 
    end

    def list
      return @order
    end
  end