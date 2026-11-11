# frozen_string_literal: true

def user_menu(_login)
  loop do
    user_input = gets.chomp.strip
    case user_input
    when '1'
      show_lot = load_lots
      show_lot.each do |lot|
        show_parse(lot)
      end
    when '2'
      show_list_of_lots
      searched_id = gets.chomp.strip.to_i
      render_search_by_id(searched_id)
    when '3'
      ask_admin_delete
      searched_id = gets.chomp.strip.to_i
      delete('lots.yml', searched_id)
      show_delete(searched_id)

    end
  end
end
