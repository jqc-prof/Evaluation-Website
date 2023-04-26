class AddUseridToSubmissions < ActiveRecord::Migration[7.0]
  def change
    
    add_column :submissions, :user_id, :integer
  end
end
