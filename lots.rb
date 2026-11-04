require_relative 'database'
require_relative 'index.rb'

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

