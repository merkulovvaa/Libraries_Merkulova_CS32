# == Schema Information
#
# Table name: libraries
#
#  id           :integer          not null, primary key
#  address      :string
#  name         :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Library < ApplicationRecord
  has_many :books
  has_many :reader_cards
end
