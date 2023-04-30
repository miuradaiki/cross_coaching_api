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

  def up_votes
    votes.where(vote_type: :up).count
  end

  def down_votes
    votes.where(vote_type: :down).count
  end

  def total_votes
    up_votes - down_votes
  end
end
