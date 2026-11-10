def render_search_by_id(searched_id)
  lot = search_lot_by_id('lots.yml', searched_id)
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
    # puts("ID лоту: #{show_lot[:id]}")
end

def show_delete(searched_id)
    lot = search_by_id('lots.yml', searched_id)
  if lot.nil? || lot.empty?
    puts('Такого лота немає')
  else
       puts "Лот з Id: #{lot[:id]}, Успішно видалено"
  end
end

def show_create_bid(temp, user_bid, temp_lot)
  
  if temp.nil? || temp.empty
    puts("Ставок ще немає")
  end
  if user_bid <= temp_lot[:current_price]
        puts("Перевірте вашу ставку")
  end
end

def list_of_lots
    puts('----------------------------')
    puts("Назва лоту: #{lot[:name]}")
    puts("Короткий опис лоту: #{lot[:lot_description]}")
    puts("Стартова ціна лоту: #{lot[:start_price]}")
    # puts("Переможець: #{[:winner]}")
    puts("ID лоту: #{lot[:id]}")
    puts('Не знайшли такий лот') if lot_parse.empty? || lot_parse.nil?
end