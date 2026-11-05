

def render_search_by_id(lot)
  if lot.nil? || lot.empty?
    puts("Такого лота немає")
  else
    puts("Лот знайдено:")
    puts "Назва: #{lot[:name]}"
    puts "Опис: #{lot[:lot_description]}"
    puts "Ціна: #{lot[:start_price]}"
  end
end


