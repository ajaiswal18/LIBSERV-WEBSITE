class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :name
      t.integer :test_code
      
      t.integer :test_time
      t.string :test_type


      t.timestamps null: false
    end
  end
end
