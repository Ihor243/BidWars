# frozen_string_literal: true

def guest_menu
  show_guest_menu
  user_input = gets.chomp.strip
  case user_input
  when '1' then sign_up
  when '2' then run(current_user: sign_in)
  when '3' then change_local
  when '4' then exit
  else show_incorrect_choice
  end
end

def sign_up
  puts 'Придумайте логін'
  login = gets.chomp.strip
  puts 'Придумайте пароль:'
  password = gets.chomp.strip
  create_user(login:, password:)
  puts 'Ви успішно зареєструвались'
  run
end

def sign_in
  puts 'Введіть ваш логін'
  login = gets.chomp.strip

  puts 'Введіть ваш пароль'
  password = gets.chomp.strip
  user = authenticate(login:, password:)

  if user.nil?
    puts 'Користувача з таким логіном і паролем не знайдено'
  else
    puts 'Ви успішно увійшли!'
    user
  end
end

def change_local
  I18n.locale = 'ua'
  run
end

def render_incorect_choice
  show_incorrect_choice
  run
end
