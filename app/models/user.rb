# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  email      :string(255)
#  first_name :string(255)
#  last_name  :string(255)
#  sex        :integer
#  uid        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :answers
  has_many :shares

  validates :uid, presence: true
end
