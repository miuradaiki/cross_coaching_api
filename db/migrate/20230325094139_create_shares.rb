class CreateShares < ActiveRecord::Migration[7.0]
  def change
    create_table :shares do |t|
      t.bigint :answer_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
