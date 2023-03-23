# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

100.times do
  Author.create(full_name: Faker::Name.name)
end

100.times do
  Library.create(name: Faker::Company.name, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.phone_number)
end

100.times do
  Book.create(title: Faker::Book.title, library: Library.last, year: Faker::Date.between(from: '1800-01-01', to: Date.today).year)
end

100.times do
  ActiveRecord::Base.connection.execute("INSERT INTO 'genres' ('name', 'created_at', 'updated_at') VALUES ('#{Faker::Book.genre}', datetime('now'), datetime('now'));")
  end
100.times do
  ActiveRecord::Base.connection.execute("INSERT INTO 'users' ('full_name', 'birth_date','created_at', 'updated_at') VALUES ('#{Faker::Name.name}', '#{Faker::Date.between(from: '1940-01-01', to: Date.today)}', datetime('now'), datetime('now'));")
end

100.times do
  ActiveRecord::Base.connection.execute("INSERT INTO 'reader_cards' ('user_id', 'library_id','created_at', 'updated_at') VALUES ('#{User.last.id}', '#{Library.last.id}', datetime('now'), datetime('now'));")
end