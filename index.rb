require_relative 'app/render'
require_relative 'database'
I18n.load_path += Dir[File.expand_path("config/locales") + "/*.yml"]
I18n.default_locale = :en # (note that `en` is already the default!)
def run
  show_guest_menu

  user_input = gets.chomp.strip

  case user_input
  when '1' then sign_up
  when '2' then sign_in
  when '3' then sign_in_admin
  when '4' then exit
  else
    show_incorrect_choice
    run
  end
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
  end
  show_user_menu(login)
end

def sign_up
  puts 'Придумайте логін'
  login = gets.chomp.strip
  puts 'Придумайте пароль:'
  password = gets.chomp.strip
  new_user = {login: login, password: password}
  file_path = file_path_for('users.yml')
  File.write(file_path, YAML.dump([])) unless File.exist?(file_path)
  records = load_from_database('users.yml')
  records.push(new_user)
  File.write(file_path, records.to_yaml)
  puts 'Ви успішно зареєструвались'
  show_user_menu(login)
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
end

run
require_relative 'app/render'
require_relative 'database'
require_relative 'lots'
require 'i18n'
I18n.load_path += Dir[File.expand_path("config/locales") + "/*.yml"]
I18n.default_locale = :en # (note that `en` is already the default!)
def run
  show_guest_menu
  puts I18n.t("test")

  user_input = gets.chomp.strip

  case user_input
  when '1' then sign_up
  when '2' then sign_in
  when '3' then exit
  when '4' then 
    I18n.locale = 'ua'
    run
  else
    show_incorrect_choice
    run
  end
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

def sign_up
  puts 'Придумайте логін'
  login = gets.chomp.strip
  puts 'Придумайте пароль:'
  password = gets.chomp.strip
  new_user = {login: login, password: password}
  add_to_database("users.yml", new_user)
  puts 'Ви успішно зареєструвались'
  
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

