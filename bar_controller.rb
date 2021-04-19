require_relative 'bar_model'
require_relative 'bar_view'
require_relative 'order_model'

class BarController
  def initialize
    @bar_model = BarModel.new
    @bar_view = BarView.new
    @order_model = OrderModel.new
  end

  def run
    menu
    loop do
      order = user_order
      item_name = order[1]
      item_qty = order[2]

      if @bar_model.in_stock?(item_name) && @bar_model.enough_stock?(item_name, item_qty)
        @bar_model.decrease_stock(item_name, item_qty)
        @order_model.add_item(item_name, item_qty)
      elsif !@bar_model.in_stock?(item_name)
        @bar_view.display_validation_message("Sorry, we don't stock #{item_name} here")
      else
        @bar_view.display_validation_message("Sorry, have that much #{item_name}")
      end
      break unless order[0]
    end

    @bar_view.display_order(@order_model.order_items)
  end

  def menu
    @bar_view.show_menu(@bar_model.drink_amounts)
  end

  def user_order
    @bar_view.order(@bar_model.drink_amounts)
  end
end

bar = BarController.new
bar.run
