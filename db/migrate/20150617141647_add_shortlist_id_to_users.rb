class AddShortlistIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shortlist_id, :integer
  end
end
