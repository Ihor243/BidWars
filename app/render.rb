def show_guest_menu
  puts 'Вітаємо вас на нашому аукціоні'
  puts 'Оберіть дію:'
  puts '1: Зареєструватися'
  puts '2: Увійти'
  puts '3: Увійти як адміністратор'
  puts("4: Змінити мову на українську")
  puts '5: Вийти'

end

def show_admin_menu(user)
  puts "Вітаю, #{user}"
  puts 'Оберіть дію:'
  puts '1: Створити лот'
  puts '2: Переглянути список лотів'
  puts '3: Видалити лот'
  puts '4: Вийти'
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
puts "#{lot_description}"
puts "Остання ставка: #{lot_price} грн"
puts 'Оберіть дію:'
puts '1: Поставити'
puts '2: Далі'
puts '3: Назад'
puts '4: Вийти'
end
def lot_name
      puts("Введіть ім'я лоту:")
end

def lot_description
    puts("Введіть опис лоту:")
end

def lot_starter_price
    puts("Введіть стартові ціну лота у грн:")
end

def show_list_of_lots
  puts("Введіть Id лоту:")
end



