def admin_menu
  loop do
    admin_input = gets.chomp.strip
    case admin_input
    when '1' then admin_lot_menu
    when '2' then
      show_list_of_lots
      searched_id = gets.chomp.strip.to_i
      render_search_by_id(searched_id)
    when '3' then  
      ask_admin_delete
      searched_id = gets.chomp.strip.to_i
      delete('lots.yml', searched_id)
      show_delete(searched_id)

    end
  end
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
