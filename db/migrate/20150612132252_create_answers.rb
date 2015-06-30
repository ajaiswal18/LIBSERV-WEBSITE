class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.integer :applicant_response_id
      t.integer :question_id
      t.string :content
      t.string :desc_ans
      t.timestamps null: false
    end
  end
end
