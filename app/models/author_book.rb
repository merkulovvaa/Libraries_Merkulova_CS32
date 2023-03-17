# == Schema Information
#
# Table name: author_books
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#  book_id    :integer          not null
#
# Indexes
#
#  index_author_books_on_author_id  (author_id)
#  index_author_books_on_book_id    (book_id)
#
# Foreign Keys
#
#  author_id  (author_id => authors.id)
#  book_id    (book_id => books.id)
#
class AuthorBook < ApplicationRecord
  belongs_to :author
  belongs_to :book
end
