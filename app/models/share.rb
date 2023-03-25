# == Schema Information
#
# Table name: shares
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  answer_id  :bigint
#  user_id    :bigint
#
class Share < ApplicationRecord
  has_many :answers
  belongs_to :user
end
