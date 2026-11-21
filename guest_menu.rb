# frozen_string_literal: true

def guest_menu
  loop do
  show_guest_menu
  user_input = gets.chomp.strip
  case user_input
  when '1' then sign_up
  when '2' then run(current_user: sign_in)
  when '3' then toggle_language
  when '4' then exit
  else puts I18n.t("errors.invalid_choice")
  end
end
end

def sign_up
  puts I18n.t('auth.choose_login')
  login = gets.chomp.strip
  puts I18n.t('auth.choose_password')
  password = gets.chomp.strip
  create_user(login:, password:)
  puts I18n.t('auth.registered')
  run
end

def sign_in
  puts I18n.t('auth.enter_login')
  login = gets.chomp.strip
  puts I18n.t('auth.enter_password')
  password = gets.chomp.strip
  user = authenticate(login:, password:)

  if user.nil?
    puts I18n.t('auth.not_found')
  else
    puts I18n.t('auth.logged_in')
    user
  end
end

def toggle_language
  I18n.locale = I18n.locale == :ua ? :en : :ua
end


def render_incorect_choice
  show_incorrect_choice
  run
end
