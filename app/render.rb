# frozen_string_literal: true

def show_guest_menu
  puts 'Вітаємо вас на нашому аукціоні'
  puts 'Оберіть дію:'
  puts '1: Зареєструватися'
  puts '2: Увійти'
  puts('3: Змінити мову на українську')
  puts '4: Вийти'
end

def show_admin_menu(user)
  puts "Вітаю, #{user}"
  puts 'Оберіть дію:'
  puts '1: Створити лот'
  puts '2: Переглянути список лотів'
  puts '3: Видалити лот'
  puts '4: закрити лот'
  puts '5: вийти'

end

def show_user_menu(user)
  puts "Вітаю, #{user}"
  puts 'Оберіть дію:'
  puts '1: Зробити ставку'
  puts '2: Переглянути статистику'
  puts '3: вийти'
end

def show_user_menu(user)
  puts "Вітаю, #{user}!"
  puts 'Оберіть дію:'
  puts '1: Переглянути відкриті лоти'
  puts '2: Зробити ставку'
  puts '3: Мої ставки'
  puts '4: Вийти'
end

def show_open_lots
  puts "Лот № #{lot_id}, #{lot_name}"
  puts lot_description
  puts "Остання ставка: #{lot_price} грн"
  puts 'Оберіть дію:'
  puts '1: Поставити'
  puts '2: Далі'
  puts '3: Назад'
  puts '4: Вийти'
end

def render_lot_name
  puts("Введіть ім'я лоту:")
end

def render_lot_description
  puts('Введіть опис лоту:')
end

def render_lot_starter_price
  puts('Введіть стартові ціну лота у грн:')
end

def show_list_of_lots
  puts('Введіть Id лоту:')
end

def show_incorrect_choice
  puts('Перевірте що ви ввели')
end

def success_created_lot
  puts 'Ви успішно створили лот'
end

def ask_admin_delete
  puts('Введіть Id лоту який хочете видалити:')
end

def ask_admin_close
  puts('Введіть Id лоту який хочете закрити:')
end

def ask_user_to_create_bid 
  puts('Введіть суму своєї ставки')
end

def show_invalid_lot_id
  puts("Такого лота немає")
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

    puts "========== ІСТОРІЯ СТАВОК =========="
    puts "ID лота: #{bid[:id]}"
    puts "Назва: #{bid[:name]}"
    puts "Опис: #{bid[:description]}"
    puts "Ваша ставка: #{bid[:current_price]}"
    puts "Ви лідер: #{bid[:is_leader] ? 'Так' : 'Ні'}"
    puts "Ставка #{current_page + 1} з #{history.length}"
    puts "===================================="

    puts '1. Далі'
    puts '2. Назад'
    puts '3. Вийти'

    choice = gets.chomp.to_i

    case choice
    when 1
      current_page += 1 if current_page < history.length - 1
    when 2
      current_page -= 1 if current_page > 0
    when 3
      break
    else
      puts 'Невірний вибір!'
    end
  end
end