require_relative 'database'

def create_lot
  puts("Введіть ім'я лоту:")
  lot_name = gets.chomp.strip
  puts("Введіть опис лоту:")
  lot_description = gets.chomp.strip
  puts("Введіть стартові ціну лота у грн:")
  start_price = gets.chomp.strip
  new_lot = {name: lot_name, lot_description: lot_description, start_price: start_price, id: next_id("lots.yml")}
  add_to_database("lots.yml", new_lot)
  puts 'Ви успішно зареєструвались'

end

create_lot