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
require 'rails_helper'

RSpec.describe Vote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
