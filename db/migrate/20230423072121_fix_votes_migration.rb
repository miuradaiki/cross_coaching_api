class FixVotesMigration < ActiveRecord::Migration[7.0]
  def change
      add_column :votes, :user_id
      add_column :votes, :vote_type
      remove_column :votes, :up_vote, :integer
      remove_column :votes, :down_vote, :integer
  end
end
