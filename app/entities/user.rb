# frozen_string_literal: true
USERS_DATABASE_NAME = 'users.yml'

def create_user(login:, password:)
  new_user = { login: login, password: secure_password(password) }
  add_to_database(USERS_DATABASE_NAME, new_user)
end

def authenticate(login:, password:)
  all_users.find { |user| user[:login] == login && user[:password] == password }
end

def all_users = load_from_database(USERS_DATABASE_NAME)
