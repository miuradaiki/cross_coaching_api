class DeleteColumnInVotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :votes, :user_id
    remove_column :votes, :vote_type
  end
end
