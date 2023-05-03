class RemoveIsEnabledFromVotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :votes, :is_enabled, :boolean
  end
end
