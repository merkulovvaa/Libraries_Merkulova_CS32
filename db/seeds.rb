# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


100.times do |index|
  User.create(full_name: Faker::Name.name, birth_date: Faker::Date.between(from: '1940-01-01', to: Date.today), email: "test#{index+1}@mail.com", password: 'password1')
end

100.times do
  Library.create(name: Faker::Company.name, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.phone_number)
end

100.times do
   Book.create(title: Faker::Book.title, library_id: Faker::Number.between(from: 1, to: 100), year: Faker::Date.between(from: '1800-01-01', to: Date.today).year)
end

100.times do
  ActiveRecord::Base.connection.execute("INSERT INTO genres (name, created_at, updated_at) VALUES ('#{Faker::Book.genre}', datetime('now'), datetime('now'));")
end

100.times do
  ActiveRecord::Base.connection.execute("INSERT INTO authors (full_name, created_at, updated_at) VALUES ('#{Faker::Name.name}', datetime('now'), datetime('now'));")
end

100.times do
  ActiveRecord::Base.connection.execute("INSERT INTO reader_cards (user_id, library_id, created_at, updated_at) VALUES ('#{Faker::Number.between(from: 1, to: 100)}', '#{Faker::Number.between(from: 1, to: 100)}', datetime('now'), datetime('now'));")
end

100.times do
  BookGenre.create(book_id: Faker::Number.between(from: 1, to: 100), genre_id: Faker::Number.between(from: 1, to: 100))
end

100.times do
  BookReaderCard.create(book_id: Faker::Number.between(from: 1, to: 100), reader_card_id: Faker::Number.between(from: 1, to: 100))
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?