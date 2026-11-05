require_relative 'app/render'
require_relative 'database'
require_relative 'lots'
require_relative 'admin_menu'
require_relative 'logic_render'
require 'i18n'
require_relative 'i18n_config'
def run
  puts I18n.t("test")
  show_guest_menu

  user_input = gets.chomp.strip

  case user_input
  when '1' then sign_up
  when '2' then sign_in
  when '3' then sign_in_admin
  when '4' then I18n.locale = 'ua'
    run
  when '5' then exit
    
    
  else
    show_incorrect_choice
    run
  end
end

def sign_up
  puts 'Придумайте логін'
  login = gets.chomp.strip
  puts 'Придумайте пароль:'
  password = gets.chomp.strip
  new_user = {login: login, password: password}
  add_to_database("users.yml", new_user)
  puts 'Ви успішно зареєструвались'
  
end

def sign_in
  puts 'Введіть ваш логін'
  login = gets.chomp.strip

  puts 'Введіть ваш пароль'
  password = gets.chomp.strip

  users = load_from_database('users.yml')
  user = users.find { |user| user[:login] == login && user[:password] == password }


  if user.nil?
    puts 'Користувача з таким логіном і паролем не знайдено'
  else
    puts 'Ви успішно увійшли!'
    parse("lots.yml")
  end
end

def sign_in_admin
  puts 'Введіть ваш логін'
  login = gets.chomp.strip

  puts 'Введіть ваш пароль'
  password = gets.chomp.strip

  admins = load_from_database('admin.yml')
  admin = admins.find { |admin| admin[:login] == login }

  if admin.nil? || BCrypt::Password.new(admin[:password]) != password
    puts 'Адміністратора з таким логіном і паролем не знайдено'
  else
    puts 'Ви успішно увійшли!'
  end
show_admin_menu(login)
admin_menu()

end

def admin_lot_menu 
  lot_name
  lot_title = gets.chomp.strip
  lot_description
  user_lot_description = gets.chomp.strip
  lot_starter_price
  user_lot_starter_price = gets.chomp.strip
  create_lot(lot_title, user_lot_description, user_lot_starter_price)
end
run

