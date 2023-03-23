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
  has_many :reader_cards, dependent: :destroy
  has_many :libraries, through: :reader_cards, dependent: :destroy

  def self.sql_update_table(id)
    ActiveRecord::Base.connection.execute("UPDATE users SET full_name = '#{Faker::Name.name}', birth_date = '#{Faker::Date.between(from: '1940-01-01', to: Date.today)}' WHERE id = #{id};")
  end
end
