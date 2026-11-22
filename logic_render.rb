# frozen_string_literal: true

require 'terminal-table'

def render_search_lot_by_id(searched_id)
  lot = find_lot_by_id(searched_id)
  if lot.nil? || lot.empty?
    puts I18n.t('lots.not_found').colorize(:red)
  else
    puts I18n.t('lots.found').colorize(:green)
    puts I18n.t('lots.short_name', name: lot[:name])
    puts I18n.t('lots.short_desc', description: lot[:lot_description])
    puts I18n.t('lots.price', price: lot[:start_price])
  end
end

def show_lot_deleted(searched_id)
  puts I18n.t('lots.deleted', id: searched_id).colorize(:red)
end

def show_create_bid(temp, user_bid)
  puts I18n.t('bids.no_bids_yet') if temp.nil? || temp.empty?
  return unless user_bid <= temp[:current_price]

  puts I18n.t('bids.check_bid')
end

def render_lots_table(lots)
  active_lots = lots.select { |lot| lot[:status] == 'active' }

  table = Terminal::Table.new(
    headings: [
      I18n.t('table_headers.id'),
      I18n.t('table_headers.name'),
      I18n.t('table_headers.description'),
      I18n.t('table_headers.start_price')
    ],
    rows: active_lots.map do |lot|
      [
        lot[:id],
        lot[:name],
        lot[:lot_description] || lot[:description],
        lot[:start_price].to_s.colorize(:green)
      ]
    end
  )

  table.align_column(3, :right)
  puts table
end

def render_lots(lots)
  lots.each do |lot|
    if lot[:status] == 'active'
      puts I18n.t('common.divider')
      render_lots_table(lot)
    end
  end
end

def render_close_lot(searched_id)
  puts I18n.t('lots.closed', id: searched_id).colorize(:red)
end

def show_closed_lot_statistic(statistic_hash)
  puts I18n.t('lots.last_price', price: statistic_hash[:current_price])
  puts I18n.t('lots.total_bids', count: statistic_hash[:total_bids_count])
  if statistic_hash[:winner_id]
    puts I18n.t('lots.winner_id', id: statistic_hash[:winner_id])
  else
    puts I18n.t('lots.no_bids_on_lot')
  end
end

def show_bid_history(user_id)
  history = get_user_bid_history(user_id)

  if history.empty?
    puts I18n.t("bid_history.empty")
    return
  end

  current_page = 0

  loop do
    bid = history[current_page]
    leader_status = bid[:is_leader] ? I18n.t("common.yes") : I18n.t("common.no")

    puts I18n.t("bid_history.title")
    puts I18n.t("bid_history.lot_id", id: bid[:id])
    puts I18n.t("bid_history.name", name: bid[:name])
    puts I18n.t("bid_history.description", description: bid[:description])
    puts I18n.t("bid_history.your_bid", price: bid[:current_price])
    puts I18n.t("common.is_leader", value: leader_status)
    puts I18n.t("bid_history.page", current: current_page + 1, total: history.length)
    puts I18n.t("bid_history.divider")

    puts I18n.t("bid_history.next")
    puts I18n.t("bid_history.prev")
    puts I18n.t("bid_history.exit")

    choice = gets.chomp.to_i

    case choice
    when 1
      current_page += 1 if current_page < history.length - 1
    when 2
      current_page -= 1 if current_page.positive?
    when 3
      break
    else
      puts I18n.t("errors.invalid_choice")
    end
  end
end

def show_victory_menu(current_id)
  history = get_user_bid_history(current_id)

  puts I18n.t("victory_menu.title")

  history.each_with_index do |bid|
    leader_status = bid[:is_leader] ? I18n.t("common.yes") : I18n.t("common.no")

    puts I18n.t("bid_history.name", name: bid[:name])
    puts I18n.t("common.is_leader", value: leader_status)
    puts I18n.t("victory_menu.divider")
  end
end
