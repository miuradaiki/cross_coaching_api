class AddVoteCountToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :up_vote, :integer
    add_column :votes, :down_vote, :integer
  end
end
