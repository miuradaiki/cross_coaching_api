class ChangeIdsDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :answers, :user_id, :bigint
    change_column :answers, :question_id, :bigint
  end
end
