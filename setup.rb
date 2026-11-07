require_relative 'database'
require 'date'

def setup
  add_to_database('users.yml',
                  { id: 1, login: 'Semen', password: secure_password('12345678'), phone_number: 380_500_738_437,
                    role: 'admin' })
end

setup
