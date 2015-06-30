class CreateApplicantResponses < ActiveRecord::Migration
  def change
    create_table :applicant_responses do |t|
    	t.integer :assessment_id
      t.integer :question_id
      t.integer :answer_id
      t.integer :user_id
     
      

      t.timestamps null: false
    end
  end
end
