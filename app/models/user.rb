# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  birth_date             :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  full_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reader_cards, dependent: :destroy
  has_many :libraries, through: :reader_cards, dependent: :destroy

  def self.sql_update_table(id)
    ActiveRecord::Base.connection.execute("UPDATE users SET full_name = '#{Faker::Name.name}', birth_date = '#{Faker::Date.between(from: '1940-01-01', to: Date.today)}' WHERE id = #{id};")
  end
end
