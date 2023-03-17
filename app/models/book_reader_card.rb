# == Schema Information
#
# Table name: book_reader_cards
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  book_id        :integer          not null
#  reader_card_id :integer          not null
#
# Indexes
#
#  index_book_reader_cards_on_book_id         (book_id)
#  index_book_reader_cards_on_reader_card_id  (reader_card_id)
#
# Foreign Keys
#
#  book_id         (book_id => books.id)
#  reader_card_id  (reader_card_id => reader_cards.id)
#
class BookReaderCard < ApplicationRecord
  belongs_to :book
  belongs_to :reader_card
end
