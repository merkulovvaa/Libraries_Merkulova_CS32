# == Schema Information
#
# Table name: book_genres
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer          not null
#  genre_id   :integer          not null
#
# Indexes
#
#  index_book_genres_on_book_id   (book_id)
#  index_book_genres_on_genre_id  (genre_id)
#
# Foreign Keys
#
#  book_id   (book_id => books.id)
#  genre_id  (genre_id => genres.id)
#
class BookGenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre
end
