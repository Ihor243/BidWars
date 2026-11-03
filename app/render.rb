def show_guest_menu
  puts 'Вітаю вас у нашій бібліотеці!'
  puts 'Оберіть дію:'
  puts '1: Зареєструватися'
  puts '2: Увійти'
  puts '3: Вийти'
end

def show_authenticated_menu(user)
  puts "Вітаю, #{user}"
  puts 'Оберіть дію:'
  puts '1: Додати книгу'
  puts '2: Додати жанр'
  puts '3: Додати автора'
  puts '4: Вийти'
end

def show_incorrect_choice
  puts 'You entered unexpected number! Please select valid!'
end
