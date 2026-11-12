# frozen_string_literal: true

def admin_menu(user)
  loop do
    show_admin_menu(user[:login])
    input = gets.chomp.strip
    case input
    when '1' then admin_create_lot_menu
    when '2' then admin_show_list_of_lots
    when '3' then admin_delete_lot_menu
    when '4' then admin_close_lot_menu
    when '5' then exit
    end
  end
end

def admin_create_lot_menu
  render_lot_name
  title = gets.chomp.strip
  render_lot_description
  description = gets.chomp.strip
  render_lot_starter_price
  starter_price = gets.chomp.strip
  create_lot(title, description, starter_price)
end

def admin_show_list_of_lots
  lots = load_lots
  if lots.empty?
    puts('Наразі лотів немає')
  else
    render_lots(lots)
  end
end

def admin_delete_lot_menu
  ask_admin_delete
  searched_id = gets.chomp.strip.to_i
  delete_lot(searched_id)
  show_lot_deleted(searched_id)
end

def admin_close_lot_menu
  ask_admin_close
  searched_id = gets.chomp.strip.to_i
  close_lot(searched_id)
  render_close_lot(searched_id)
end
