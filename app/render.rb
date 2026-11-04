def show_guest_menu
  puts 'Вітаємо вас на нашому аукціоні'
  puts 'Оберіть дію:'
  puts '1: Зареєструватися'
  puts '2: Увійти'
  puts '3: Вийти'
end

def show_authenticated_menu(user)
  puts "Вітаю, #{user}"
  puts 'Оберіть дію:'
  puts '1: Створити лот'
  puts '2: Видалити лот'
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
