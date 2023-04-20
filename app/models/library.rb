# == Schema Information
#
# Table name: libraries
#
#  id           :integer          not null, primary key
#  address      :string
#  city         :string
#  name         :string
#  phone_number :string
#  year         :integer
#  zip_code     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Library < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :reader_cards, dependent: :destroy
  has_many :genres, through: :books
  has_many :users, through: :reader_cards

  def update_table
    self.update(name: "UkLibrary", address: "Naukova, 59", phone_number: "084969395")
  end
end
