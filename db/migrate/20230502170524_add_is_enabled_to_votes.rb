class AddIsEnabledToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :is_enabled, :boolean, default: false
  end
end
