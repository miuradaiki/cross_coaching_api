# == Schema Information
#
# Table name: votes
#
#  id          :bigint           not null, primary key
#  is_enabled  :boolean
#  vote_type   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  feedback_id :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_votes_on_user_id_and_feedback_id  (user_id,feedback_id) UNIQUE
#
