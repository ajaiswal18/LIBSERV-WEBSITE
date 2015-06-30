class CreateTestScores < ActiveRecord::Migration
  def change
    create_table :test_scores do |t|
      t.integer :user_id
      t.integer :assessment_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
