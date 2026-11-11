# frozen_string_literal: true

def create_bid(user_bid, login, searched_id, current_id)
  temp = load_lots
  temp_lot = find_lot_by_id(searched_id, temp)
  return unless temp_lot
  return unless user_bid > temp_lot[:current_price]
  temp_lot[:current_price] = user_bid
  temp_lot[:winner_id] = current_id
  temp_lot[:winner_login] = login
  save_all('lots.yml', temp)
end
