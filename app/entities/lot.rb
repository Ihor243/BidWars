# frozen_string_literal: true

LOTS_DATABASE_NAME = 'lots.yml'

def load_lots = load_from_database(LOTS_DATABASE_NAME)

def create_lot(title, description, starter_price)
  new_lot = {
    name: title,
    lot_description: description,
    start_price: starter_price,
    status: 'active'
  }
  add_to_database(LOTS_DATABASE_NAME, new_lot)
end

def find_lot_by_id(searched_id)
  load_lots.find { |lot| lot[:id] == searched_id }
end

def delete_lot(searched_id) = delete(LOTS_DATABASE_NAME, searched_id)

def close_lot_status(searched_id)
  lots = load_lots
  found_lot = lots.find { |lot| lot[:id] == searched_id }
  return unless found_lot

  found_lot[:status] = 'closed'
  save_all(LOTS_DATABASE_NAME, lots)
end

def closed_lot_statistic(searched_id)
  lot = find_lot_by_id(searched_id)
  return nil unless lot

  bids = find_bids_by_lot_id(searched_id)
  current_price = max_bids_price(bids, lot)
  last_bid = bids.last
  winner_id = last_bid ? last_bid[:bidder_id] : nil

  {
    lot: lot,
    current_price: current_price,
    total_bids_count: bids.count,
    winner_id: winner_id
  }
end
