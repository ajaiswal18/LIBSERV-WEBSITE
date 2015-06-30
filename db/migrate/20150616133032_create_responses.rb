class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
    	t.integer :user_id
    	t.integer :assessment_id

    	t.integer :question_id
    	t.integer :answer_id
      t.integer :answerbyuser

    	t.integer :applicant_response_id
    	t.string :response_text
      t.string :desc_answer
    	t.integer :score
      t.timestamps null: false
    end
  end
end
