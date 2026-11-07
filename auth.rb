
def sign_up
  puts 'Придумайте логін'
  login = gets.chomp.strip
  puts 'Придумайте пароль:'
  password = gets.chomp.strip
  new_user = { login: login, password: secure_password(password), id: next_id('users.yml')}
  add_to_database('users.yml', new_user)
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
  end

   if user[:role] == 'admin' 
    sign_in_admin(login, password) 
    show_admin_menu(login)
    admin_menu
    else
       show_user_menu(login)
    end
end

def sign_in_admin(login, password)
  admins = load_from_database('admin.yml')
  admin = admins.find { |admin| admin[:login] == login }

  if admin.nil? || BCrypt::Password.new(admin[:password]) != password
    puts 'Адміністратора з таким логіном і паролем не знайдено'
  else
    puts 'Ви успішно увійшли!'
  end
end


