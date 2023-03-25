class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.bigint :feedback_id
      t.bigint :user_id
      t.integer :vote_type

      t.timestamps
    end
  end
end
