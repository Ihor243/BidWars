# frozen_string_literal: true

require 'rake'
require_relative 'database'
task :create_admin, 'Creates admin' do
  add_to_database('users.yml', { id: 1, login: 'Semen', password: secure_password('12345678'),
                                 phone_number: 380_500_738_437, role: 'admin' })
end
