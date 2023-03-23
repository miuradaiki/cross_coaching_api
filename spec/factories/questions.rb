# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :question do
    title { "MyString" }
    description { "MyText" }
  end
end
