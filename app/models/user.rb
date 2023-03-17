# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  birth_date :date
#  full_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :reader_cards
  has_many :libraries, through: :reader_cards
end
