class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.bigint :answer_id
      t.bigint :user_id
      t.text :description

      t.timestamps
    end
  end
end
