class BarView
  def show_menu(drinks)
    puts 'what would you like to order?'
    item_num = 1
    drinks.each do |drink, _amount|
      puts "#{item_num}. #{drink}"
      item_num += 1
    end
  end

  def order(_drinks)
    puts 'drink name:'
    drink = gets.strip.downcase
    puts "how many #{drink}s would you like?:"
    qty = gets.to_i

    puts 'Is that all today? (y/n)'
    done = gets.chomp
    if done == 'y'
      puts "No worries, I'll get those drinks for you now..."
      [false, drink, qty]
    else
      [true, drink, qty]
    end
  end

  def display_order(order)
    puts 'Here is your order:'
    order.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:qty]}x #{item[:item_name]}"
    end
  end

  def display_validation_message(message)
    return unless message
    puts message
  end
end
