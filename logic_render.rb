# frozen_string_literal: true

def render_search_lot_by_id(searched_id)
  lot = find_lot_by_id(searched_id)
  if lot.nil? || lot.empty?
    puts('Такого лота немає')
  else
    puts('Лот знайдено:')
    puts "Назва: #{lot[:name]}"
    puts "Опис: #{lot[:lot_description]}"
    puts "Ціна: #{lot[:start_price]}"
  end
end

def show_parse(show_lot)
  puts('----------------------------')
  puts('Не знайшли такий лот') if show_lot.empty? || show_lot.nil?
  puts("Назва лоту: #{show_lot[:name]}")
  puts("Короткий опис лоту: #{show_lot[:lot_description]}")
  puts("Стартова ціна лоту: #{show_lot[:start_price]}")
  # puts("Переможець: #{[:winner_login]}")
  puts("ID лоту: #{show_lot[:id]}")
end

def show_lot_deleted(searched_id)
  puts "Лот з Id: #{searched_id}, Успішно видалено"
end

def show_create_bid(temp, user_bid)
  puts('Ставок ще немає') if temp.nil? || temp.empty?
  return unless user_bid <= temp[:current_price]

  puts('Перевірте вашу ставку')
end

def render_lot(lot)
  puts("Назва лоту: #{lot[:name]}")
  puts("Короткий опис лоту: #{lot[:lot_description]}")
  puts("Стартова ціна лоту: #{lot[:start_price]}")
  puts("Номер лоту: #{lot[:id]}")
end

def render_lots(lots)
  lots.each do |lot|
    if lot[:status] == 'active'
      puts('----------------------------')
      render_lot(lot)
    end
  end
end

def render_close_lot(searched_id)
  puts "Лот з Id: #{searched_id}, Успішно закрито"
end

def show_closed_lot_statistic(statistic_hash)
  puts("Остання ціна: #{statistic_hash[:current_price]}")
  puts("Усього ставок: #{statistic_hash[:total_bids_count]}")
  if statistic_hash[:winner_id]
    puts("Переможець юзер з ID: #{statistic_hash[:winner_id]}")
  else
    puts('Ніхто не ставив на цей лот')
  end
end

def show_bid_history(user_id)
  history = get_user_bid_history(user_id)

  if history.empty?
    puts 'Історія ставок порожня.'
    return
  end

  current_page = 0

  loop do
    bid = history[current_page]

    puts '========== ІСТОРІЯ СТАВОК =========='
    puts "ID лота: #{bid[:id]}"
    puts "Назва: #{bid[:name]}"
    puts "Опис: #{bid[:description]}"
    puts "Ваша ставка: #{bid[:current_price]}"
    puts "Ви лідер: #{bid[:is_leader] ? 'Так' : 'Ні'}"
    puts "Ставка #{current_page + 1} з #{history.length}"
    puts '===================================='

    puts '1. Далі'
    puts '2. Назад'
    puts '3. Вийти'

    choice = gets.chomp.to_i

    case choice
    when 1
      current_page += 1 if current_page < history.length - 1
    when 2
      current_page -= 1 if current_page.positive?
    when 3
      break
    else
      puts 'Невірний вибір!'
    end
  end
end

def show_victory_menu(current_id)
  history = get_user_bid_history(current_id)
  

  puts 'Історія виграшів'

  history.each_with_index do |bid|
    binding.irb
    puts "Назва: #{bid[:name]}"
    puts "Ви лідер: #{bid[:is_leader] ? 'Так' : 'Ні'}"
    puts "------------------------"
  end
end
