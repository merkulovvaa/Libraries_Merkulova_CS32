# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Genre < ApplicationRecord
  has_many :book_genres, dependent: :destroy
  has_many :books, through: :book_genres, dependent: :destroy

  def self.sql_update_table(id)
    ActiveRecord::Base.connection.execute("UPDATE genres SET name = '#{Faker::Book.genre}' WHERE id = #{id};")
  end

end
