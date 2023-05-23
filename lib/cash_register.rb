
class CashRegister
    attr_accessor :discount, :total, :items, :last_item
  
    def initialize(discount = 0)
      @discount = discount
      @total = 0
      self.items = []
    end
  
    def add_item(title, price, quantity = 1)
      if quantity == 1
        self.items << title
      else
        quantity.times do |x|
          self.items.push(title)
        end
      end
      self.total += (price * quantity)
      self.last_item = (price * quantity)
    end
  
    def apply_discount
      if self.discount > 0
        self.total -= (self.total * self.discount / 100)
        self.last_item -= (self.last_item * self.discount / 100)
        "After the discount, the total comes to $#{self.total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= self.last_item
    end
  end