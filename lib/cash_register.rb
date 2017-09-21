require "pry"

class CashRegister
  attr_reader :discount, :items, :last_transaction
  attr_accessor :total

  def initialize(discount=0)
    @total = 0
    @items = []
    @discount = discount

  end

  def add_item(item, price, quantity=1)
    @total += price * quantity
    quantity.times {@items << item}
    @last_transaction = price * quantity

  end

  def apply_discount
    if discount != 0
      self.total = (total - (total * (discount.to_f/100)))
      self.total = self.total.to_i
      "After the discount, the total comes to $#{self.total}."

    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = total - last_transaction
  end

end
