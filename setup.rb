require_relative 'database'
require "data"
def setup
  add_to_database('users.yml', { id: 1, login: 'Denys', password: secure_password('12345678'), date_of_birth: Date.new("1993-5-16") })
  add_to_database('users.yml', { id: 2, login: 'Semen', password: secure_password('12345678') })

  add_to_database('genres.yml', { id: 1, name: 'Horror' })
  add_to_database('genres.yml', { d: 2, name: 'Roman' })
  add_to_database('genres.yml', { id: 3, name: 'Novel' })
  add_to_database('genres.yml', { id: 4, name: 'Education' })

  add_to_database('authors.yml', { id: 1, name: 'Artem', surname: 'Usovich', pseudonym: 'CoolHacker2007' })
  add_to_database('authors.yml', { id: 2, name: 'Denys', surname: 'Zemlianoi', pseudonym: 'NotACoolHacker2007' })

  add_to_database('books.yml', { id: 1, name: 'English (Galitsinsky)', author_id: 2, genre_id: 4 })
  add_to_database('books.yml', { id: 2, name: 'Lord Of The Pears', author_id: 1, genre_id: 1 })
end

setup
