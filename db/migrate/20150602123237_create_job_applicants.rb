class CreateJobApplicants < ActiveRecord::Migration
  def change
    create_table :job_applicants do |t|
      t.string :name
      t.string :emailid
      t.string :contact_no
      t.string :applying_for
      t.string :attachment

      t.timestamps null: false
    end
  end
end
