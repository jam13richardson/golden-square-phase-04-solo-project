class Menu
    def initialize
      @menu = []
    end
  
    def add(dish) # dish is a instance of Dish, adds dish to the menu.
      @menu << dish 
    end
  
    def remove(dish) # dish is a string, removes dish from the menu.
      if @menu.include?(dish)
        @menu.delete(dish)
      else fail "Error dish not found"
      end 
    end
  
    def list
      @menu
    end
  end