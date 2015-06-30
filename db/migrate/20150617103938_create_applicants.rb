class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :emailid
      t.integer :assessment_id
      t.string :password
      t.integer :score

      t.timestamps null: false
    end
  end
end
