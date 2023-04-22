# == Schema Information
#
# Table name: feedbacks
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  answer_id   :bigint
#  user_id     :bigint
#
class Feedback < ApplicationRecord
  has_many :votes
  belongs_to :answer
end
