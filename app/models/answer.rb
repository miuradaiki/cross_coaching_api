# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint
#  user_id     :bigint
#
class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :share
end
