def search_by_id(file_name, searched_id)
  lots_parse = load_from_database(file_name)
  lots_parse.find { |lot| lot[:id] }
end

def parse(file_name)
  lot_parse = load_from_database(file_name)
  lot_parse.each do |lot|
  end
end

def create_lot(lot_title, user_lot_description, user_lot_starter_price)
  new_lot = {
    name: lot_title,
    lot_description: user_lot_description,
    start_price: user_lot_starter_price,
    id: next_id('lots.yml')
  }
  add_to_database('lots.yml', new_lot)
end

def delete(file_name, searched_id)
  lots = load_from_database(file_name)
  new_lot = lots.select { |lot| lot[:id] != searched_id }
  file_path = file_path_for(file_name)
  File.write(file_path, new_lot.to_yaml)
end


#Що робить цей метод? 
#він бере шукає лот за id
#Потім видаляє його з lots.yml
#Як він його видаляє? 