def admin_menu 
  loop do
    admin_input = gets.chomp.strip
    case(admin_input)
    when '1' then admin_lot_menu
    when '2' then  
      show_list_of_lots
      searched_id = gets.chomp.strip.to_i
      lot = search_by_id('lots.yml', searched_id)
      render_search_by_id(lot)
  end
end
end
#Що робить цей метод? 
#Він організовує меню адміна щоб не приходилося роздувати сам index.rb
