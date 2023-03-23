# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#  user_id     :integer
#
FactoryBot.define do
  factory :answer do
    user_id { 1 }
    question_id { 1 }
    description { "MyText" }
  end
end
