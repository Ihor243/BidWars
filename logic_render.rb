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

def show_create_bid(temp, user_bid, temp_lot)
  puts('Ставок ще немає') if temp.nil? || temp.empty?
  return unless user_bid <= temp_lot[:current_price]

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
