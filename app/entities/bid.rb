# frozen_string_literal: true

def create_bid(user_bid, searched_id, current_id)
  temp_lot = find_lot_by_id(searched_id)
  return unless temp_lot
  return if user_bid < temp_lot[:current_price]

  temp_lot[:current_price] = user_bid
  temp_lot[:winner_id] = current_id
  save_all('lots.yml', temp)
end
