def user_menu(login)
  loop do
    user_input = gets.chomp.strip
    case user_input
    when '1' then 
      show_lot = load_lots('lots.yml') 
      show_lot.each do |lot|
      show_parse(lot)
      end
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