# frozen_string_literal: true

def admin_menu
  loop do
    admin_input = gets.chomp.strip
    case admin_input
    when '1' then admin_create_lot_menu
    when '2'
      show_list_of_lots
      searched_id = gets.chomp.strip.to_i
      render_search_lot_by_id(searched_id)
    when '3'
      ask_admin_delete
      searched_id = gets.chomp.strip.to_i
      delete('lots.yml', searched_id)
      show_delete(searched_id)
    when '4'
      exit

    end
  end
end

def admin_create_lot_menu
  lot_name
  title = gets.chomp.strip
  lot_description
  description = gets.chomp.strip
  lot_starter_price
  starter_price = gets.chomp.strip
  create_lot(title, description, starter_price)
end
