# frozen_string_literal: true

require 'colorize'

def show_guest_menu
  puts I18n.t("guest_menu.welcome")
  puts I18n.t("common.choose_action")
  puts I18n.t("guest_menu.register")
  puts I18n.t("guest_menu.login")
  puts I18n.t("guest_menu.switch_lang")
  puts I18n.t("guest_menu.exit")
end

def show_admin_menu(user)
  puts I18n.t("common.greeting", user: user)
  puts I18n.t("common.choose_action")
  puts I18n.t("admin_menu.create_lot")
  puts I18n.t("admin_menu.list_lots")
  puts I18n.t("admin_menu.delete_lot")
  puts I18n.t("admin_menu.close_lot")
  puts I18n.t("admin_menu.exit")
end

def show_user_menu(user)
  puts I18n.t("common.greeting_bang", user: user)
  puts I18n.t("common.choose_action")
  puts I18n.t("user_menu.view_and_bid")
  puts I18n.t("user_menu.my_stats")
  puts I18n.t("user_menu.exit")
  puts I18n.t("user_menu.victory_history")
end

def show_open_lots
  puts I18n.t("open_lots.header", id: lot_id, name: lot_name)
  puts lot_description
  puts I18n.t("open_lots.last_bid", price: lot_price)
  puts I18n.t("common.choose_action")
  puts I18n.t("open_lots.place_bid")
  puts I18n.t("open_lots.next")
  puts I18n.t("open_lots.prev")
  puts I18n.t("open_lots.exit")
end

def render_lot_name
  puts I18n.t("lots.enter_name")
end

def render_lot_description
  puts I18n.t("lots.enter_description")
end

def render_lot_starter_price
  puts I18n.t("lots.enter_start_price")
end

def show_list_of_lots
  puts I18n.t("lots.enter_id")
end

def show_incorrect_choice
  puts I18n.t("errors.check_input").colorize(:red)
end

def success_created_lot
  puts I18n.t("lots.created").colorize(:green)
end

def ask_admin_delete
  puts I18n.t("lots.ask_delete_id")
end

def ask_admin_close
  puts I18n.t("lots.ask_close_id")
end

def ask_user_to_create_bid
  puts I18n.t("bids.enter_amount")
end

def show_invalid_lot_id
  puts I18n.t("lots.not_found")
end
