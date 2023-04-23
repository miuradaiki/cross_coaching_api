class AddTypeIdToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :user_id, :bigint
    add_column :votes, :vote_type, :integer
  end
end
