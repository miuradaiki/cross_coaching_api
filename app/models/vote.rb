# == Schema Information
#
# Table name: votes
#
#  id          :bigint           not null, primary key
#  down_vote   :integer
#  up_vote     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  feedback_id :bigint
#
class Vote < ApplicationRecord
  belongs_to :feedback
end
