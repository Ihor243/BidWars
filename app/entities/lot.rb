# frozen_string_literal: true

def search_lot_by_id(searched_id)
  lots_parse = load_lots
  lots_parse.find { |lot| lot[:id] }
end

def load_lots
  load_from_database('lots.yml')
end

def create_lot(title, description, starter_price)
  new_lot = {
    name: title,
    lot_description: description,
    start_price: starter_price,
    current_price: starter_price,
    winner_login: nil,
    winner_id: nil,
  }
  add_to_database('lots.yml', new_lot)
end

def find_lot_by_id(searched_id, temp)
  temp_lot = temp.find { |lot| lot[:id] == searched_id }
end
