class RemoveUpAndDownVotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :votes, :up_vote, :integer
    remove_column :votes, :down_vote, :integer
  end
end
