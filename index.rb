require_relative 'app/render'
require_relative 'database'

def run
  show_guest_menu

  user_input = gets.chomp.strip

  case user_input
  when '1' then sign_up
  when '2' then sign_in
  when '3' then exit
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

  binding.irb

  if user.nil?
    puts 'Користувача з таким логіном і паролем не знайдено'
  else
    puts 'Ви успішно увійшли!'
  end
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
end


run
