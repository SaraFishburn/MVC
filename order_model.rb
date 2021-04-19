class OrderModel
  def initialize
    @order = []
  end

  def add_item(item_name, qty = 1)
    @order << { item_name: item_name, qty: qty }
  end

  def order_items
    @order
  end
end
