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
require 'rails_helper'

RSpec.describe Share, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
