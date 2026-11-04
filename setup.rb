require_relative 'database'
require "date"



def setup()
  add_to_database('admin.yml', { id: 1, login: 'Semen', password: secure_password('12345678'), phone_number: +380500738437, role: "admin" })
 
end

setup
