# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  email      :string(255)
#  first_name :string(255)
#  last_name  :string(255)
#  sex        :integer
#  uid        :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it "should be valid" do
    expect(user).to be_valid
  end

  it "uid should be present" do
    user.uid = " "
    expect(user).to be_invalid
  end

end
