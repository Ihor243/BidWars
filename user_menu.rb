# frozen_string_literal: true

def user_menu(user, current_id)
  loop do
    show_user_menu(user[:login])
    user_input = gets.chomp.strip
    case user_input
    when '1' then user_bid_menu(current_id)
    when '2' then show_bid_history(current_id)
    when '3'then exit
    when '4' then show_victory_menu(current_id)
    end
  end
end

def user_bid_menu(current_id)
  user_show_list_of_lots
  puts('Виберіть номер лота на який хочете поставити')
  user_choice = gets.chomp.strip.to_i
  choosen_lot = find_lot_by_id(user_choice)
  if choosen_lot
    ask_user_to_create_bid
    user_bid = gets.chomp.strip.to_i
    create_bid(user_bid, user_choice, current_id)
  else
    show_invalid_lot_id
  end
end

def user_show_list_of_lots
  lots = load_lots
  if lots.empty?
    puts('Наразі лотів немає')
  else
    render_lots(lots)
  end
end

