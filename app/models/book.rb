# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  year       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  library_id :integer          not null
#
# Indexes
#
#  index_books_on_library_id  (library_id)
#
# Foreign Keys
#
#  library_id  (library_id => libraries.id)
#
class Book < ApplicationRecord
  belongs_to :library
  has_many :author_books
  has_many :book_genres
  has_many :book_reader_cards
  has_many :authors, through: :author_books
  has_many :genres, through: :book_genres
  has_many :reader_cards, through: :book_reader_cards
end
