def search_lot_by_id(file_name, searched_id)
  lots_parse = load_from_database(file_name)
  lots_parse.find { |lot| lot[:id] }
end

def load_lots(file_name)
  load_from_database(file_name)
end

def create_lot(title, description, starter_price)
  new_lot = {
    name: title,
    lot_description: description,
    start_price: starter_price,
    current_price: starter_price,
    winner_login: nil,
    winner_id: nil,
    id: next_id('lots.yml')
  }
  add_to_database('lots.yml', new_lot)
end

def delete(file_name, searched_id)
  lots = load_from_database(file_name)
  new_lot = lots.select { |lot| lot[:id] != searched_id }
  save_all('lots.yml', new_lot)
end


#Що робить цей метод? 
#він бере шукає лот за id
#Потім видаляє його з lots.yml
#Як він його видаляє? 