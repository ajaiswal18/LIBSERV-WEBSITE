class CreateJobpostings < ActiveRecord::Migration
  def change
    create_table :jobpostings do |t|
      t.string :S_No
      t.date :Posted_On
      t.string :Job_Title
      t.string :CTC
      t.text :Job_Description
      t.text :Experience_Req

      t.timestamps null: false
    end
  end
end
