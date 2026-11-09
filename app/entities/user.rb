def create_bid(user_bid, searched_id, login) 
  temp = load_from_database('lots.yml')
  temp_lot = temp.find { |lot| lot[:id] == searched_id }

  if temp_lot
  write_create_bid(user_bid, login, temp_lot, temp)
end
end

def write_create_bid(user_bid, login, temp_lot, temp)
  if user_bid > temp_lot[:current_price]
    temp_lot[:current_price] = user_bid
    temp_lot[:winner_login] = login
    file_path = file_path_for('lots.yml')
    File.write(file_path, temp.to_yaml)
  end
end

#Що робить конретно цей метод? Він бере перевіряє чи ставка юзера більша за ставку початкову і якщо так то
#вона записує нову ціну та айді і логін цього нового юзера до bids.ymllogin