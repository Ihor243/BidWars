require_relative 'database'
require_relative 'logic_render'
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
  lot_parse = load_from_database(file_name)
  lot_parse.each do |lot|
    puts("----------------------------")
    puts("Назва лоту: #{lot[:name]}")
    puts("Короткий опис лоту: #{lot[:lot_description]}")
    puts("Стартова ціна лоту: #{lot[:start_price]}")
    #puts("Переможець: #{[:winner]}")
    puts("Не знайшли такий лот") if lot_parse.empty? || lot_parse.nil?
  end
end

def search_by_id(file_name, searched_id)
    lots_parse = load_from_database(file_name)
    show_list_of_lots
    lots_parse.find { |lot| lot[:id]}
end

