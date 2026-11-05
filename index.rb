require_relative 'app/render'
require_relative 'database'
require_relative 'lots'
require_relative 'admin_menu'
require_relative 'logic_render'
require 'i18n'
require_relative 'i18n_config'
require_relative 'auth'
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



loop do
  run
end


