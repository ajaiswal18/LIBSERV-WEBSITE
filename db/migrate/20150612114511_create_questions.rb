class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :assessment_id
      t.text :content
      t.string :correct_answer
      

      t.timestamps null: false
    end
  end
end
