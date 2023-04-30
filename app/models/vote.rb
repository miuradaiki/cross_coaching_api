# == Schema Information
#
# Table name: votes
#
#  id          :bigint           not null, primary key
#  vote_type   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  feedback_id :bigint
#  user_id     :bigint
#
class Vote < ApplicationRecord
  belongs_to :feedback

  enum vote_type: { down: 0, up: 1 }
end
