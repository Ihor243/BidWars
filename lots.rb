require_relative 'database'
def create_lot(lot_title, user_lot_description, user_lot_starter_price)
  new_lot = {
    name: lot_title, 
    lot_description: user_lot_description, 
    start_price: user_lot_starter_price, 
    id: next_id("lots.yml")
  }
  add_to_database("lots.yml", new_lot)
  puts 'Ви успішно створили лот'
end

def parse(file_name)
  data_parse = load_from_database('lots.yml')
  data_parse.each do |lot|
    puts("----------------------------")
    puts("Назва лоту: #{lot[:name]}")
    puts("Короткий опис лоту: #{lot[:lot_description]}")
    puts("Стартова ціна лоту: #{lot[:start_price]}")
    #puts("Переможець: #{[:winner]}")
    puts("Не знайшли такий лот") if data_parse.empty? || data_parse.nil?
  end
end

def show_lot_by_id
  
end
#Що робить цей метод? 
#Він бере парсить lots.yml 
#красиво виводить цей масив 
#