# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  full_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books, dependent: :destroy

  def update_table
    self.update( full_name: '#{Faker::Name.name}')
  end

end
