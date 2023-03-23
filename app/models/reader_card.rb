# == Schema Information
#
# Table name: reader_cards
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  library_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_reader_cards_on_library_id  (library_id)
#  index_reader_cards_on_user_id     (user_id)
#
# Foreign Keys
#
#  library_id  (library_id => libraries.id)
#  user_id     (user_id => users.id)
#
class ReaderCard < ApplicationRecord
  belongs_to :library
  belongs_to :user
  has_many :books_reader_cards
  has_many :books, through: :books_reader_cards

  def self.sql_update_table(user_id, library_id, id)
    ActiveRecord::Base.connection.execute("UPDATE reader_cards SET user_id = #{user_id}, library_id = #{library_id} WHERE id = #{id};")
  end
end
