# frozen_string_literal: true

require 'bcrypt'
require 'yaml'

def add_to_database(file_name, new_entity)
  file_path = file_path_for(file_name)

  File.write(file_path, YAML.dump([])) unless File.exist?(file_path)

  records = load_from_database(file_name)

  new_entity[:id] = if records.empty? || records.nil?
                      1
                    else
                      records.max_by { |record| record[:id] }[:id] + 1
                    end

  records.push(new_entity)

  File.write(file_path, records.to_yaml)
end

def load_from_database(file_name)
  file_path = file_path_for(file_name)
  return [] unless File.exist?(file_path)

  YAML.safe_load_file(file_path_for(file_name), permitted_classes: [String, Symbol, Integer, BCrypt::Password])
end

def secure_password(password) = BCrypt::Password.create(password)

def file_path_for(file_name) = "database/#{file_name}"

def save_all(file_name, data)
  file_path = file_path_for(file_name)
  File.write(file_path, data.to_yaml)
end

def delete(file_name, searched_id)
  object = load_from_database(file_name)
  rewritten_object = object.reject { |item| item[:id] == searched_id }
  save_all(file_name, rewritten_object)
end
