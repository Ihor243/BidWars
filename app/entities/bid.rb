# frozen_string_literal: true

BITS_DATABASE_NAME = 'bids.yml'

def create_bid(user_bid, lot_id, current_id)
  lot = find_lot_by_id(lot_id)
  bid = find_bids_by_lot_id(lot_id)
  return unless lot
  current_price = max_bids_price(bid, lot)
  return if user_bid <= current_price.to_i
  new_bid = {
    lot_id: lot[:id],
    current_price: user_bid,
    bidder_id: current_id
  }
  add_to_database(BITS_DATABASE_NAME, new_bid)
end

def load_bids = load_from_database(BITS_DATABASE_NAME)

def find_bids_by_lot_id(lot_id)
  load_bids.select { |bid| bid[:lot_id] == lot_id }
end

def max_bids_price(bids, lot)
  max_bid = bids.max_by { |bid| bid[:current_price] }
  max_bid.nil? ? lot[:start_price] : max_bid[:current_price]
end

