require 'i18n'
require_relative 'config_files/i18n'
require_relative 'database'
require_relative 'app/render'
require_relative 'auth'
require_relative 'app/entities/lot'
require_relative 'admin_menu'
require_relative 'logic_render'


def run

  show_guest_menu

  user_input = gets.chomp.strip

  case user_input
  when '1' then sign_up
  when '2' then sign_in
  when '3' then I18n.locale = 'ua'
                run
  when '4' then exit
  else
    show_incorrect_choice
    run
  end
end


  run