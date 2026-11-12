# frozen_string_literal: true

require_relative 'config/i18n'
require_relative 'database'

require_relative 'app/entities/bid'
require_relative 'app/entities/user'
require_relative 'app/entities/lot'

require_relative 'guest_menu'
require_relative 'admin_menu'
require_relative 'user_menu'

require_relative 'logic_render'
require_relative 'app/render'

def run(current_user: nil)
  if current_user.nil?
    guest_menu
  elsif current_user[:role] == 'admin'
    admin_menu(current_user)
  else
    user_menu(current_user)
  end
end

run
