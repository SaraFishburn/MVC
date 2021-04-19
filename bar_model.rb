class BarModel
  attr_accessor :drink_amounts

  def initialize
    @drink_amounts = {
      beer: 100,
      martini: 100,
      coke: 100
    }
  end

  def in_stock?(item_name)
    name = item_name.to_sym
    return true if @drink_amounts[name]
  end

  def enough_stock?(item_name, amount = 1)
    name = item_name.to_sym
    return true if @drink_amounts[name] >= amount
  end

  def decrease_stock(item_name, amount = 1)
    @drink_amounts[item_name.to_sym] -= amount
  end
end
