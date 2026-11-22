# frozen_string_literal: true

BITS_DATABASE_NAME = 'bids.yml'

def create_bid(user_bid, lot_id, current_id)
  lot = find_lot_by_id(lot_id)
  bids = find_bids_by_lot_id(lot_id)
  return unless lot

  current_price = max_bids_price(bids, lot)
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

def find_bids_by_user_id(user_id)
  load_bids.select { |bid| bid[:bidder_id] == user_id }
end

def get_user_bid_history(user_id)
  bids = find_bids_by_user_id(user_id)

  bids.map do |bid|
    lot = find_lot_by_id(bid[:lot_id])
    next unless lot

    {
      id: lot[:id],
      name: lot[:name],
      description: lot[:lot_description],
      current_price: bid[:current_price],
      is_leader: lot[:winner_id] == user_id
    }
  end.compact
end

def get_user_bid_stats(user_id)
  bids = find_bids_by_user_id(user_id)

  {
    total_bids_count: bids.length,
    lost_bids_count: bids.count do |bid|
      lot_bids = find_bids_by_lot_id(bid[:lot_id])
      lot_bids.max_by { |b| b[:current_price] }[:bidder_id] != user_id
    end
  }
end
