def create_bid(user_bid, login, searched_id) 
  temp = load_from_database('lots.yml')
  temp_lot = temp.find { |lot| lot[:id] == searched_id }

  if temp_lot
  user_id = currents_user_id(login)
  write_create_bid(user_bid, login, temp_lot, temp, user_id)
end
end

def write_create_bid(user_bid, login,temp_lot, temp, user_id )
  if user_bid > temp_lot[:current_price]
    temp_lot[:current_price] = user_bid
    temp_lot[:winner_id] = user_id
    temp_lot[:winner_login] = login
    save_all('lots.yml', temp)
  end
end

def currents_user_id(login)
  temp_user_id = load_from_database('users.yml')
  user = temp_user_id.find{ |user| user[:login] == login}
  if user
    user[:id]
  end
end