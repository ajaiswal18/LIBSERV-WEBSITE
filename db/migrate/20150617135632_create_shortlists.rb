class CreateShortlists < ActiveRecord::Migration
  def change
    create_table :shortlists do |t|
    	
    	t.integer :assessment_id
    	t.string :assessment_code

      t.timestamps null: false
    end
  end
end
 