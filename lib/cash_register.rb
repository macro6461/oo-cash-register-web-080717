require 'pry'
class CashRegister

  attr_accessor :total, :discount, :quantity, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @@items = []
  end

  def items
    @@items
  end


  def add_item(title, price, quantity=1)
      @last_transaction = price * quantity
      self.total += @last_transaction
      quantity.times {@@items << title}
      # @last_transaction = @total
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      # binding.pry
      money_from_total = @total * ( @discount * 0.01)
      @total -= money_from_total
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
