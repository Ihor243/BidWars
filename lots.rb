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
  data_parse = load_from_database(file_name)
  data_parse.each do |lot|
    puts("----------------------------")
    puts("Назва лоту: #{lot[:name]}")
    puts("Короткий опис лоту: #{lot[:lot_description]}")
    puts("Стартова ціна лоту: #{lot[:start_price]}")
    #puts("Переможець: #{[:winner]}")
    puts("Не знайшли такий лот") if data_parse.empty? || data_parse.nil?
  end
end

def show_lot_by_id(file_name)
    lots_parse = load_from_database(file_name)
    puts("Введіть Id лоту:")
    searched_id = gets.chomp.strip.
    found_lot = lots_parse.find { |lot| lot[:id]}
    if found_lot == searched_id
      puts "Знайдений лот:"
      puts "Назва: #{found_lot[:name]}"
      puts "Опис: #{found_lot[:lot_description]}"
      puts "Ціна: #{found_lot[:start_price]}"
    else
      puts("Такого лоту немає перевірте ще раз введний ID")
    end
end

