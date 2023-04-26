class AddSubmissionIdToRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :submission_id, :integer
    add_index  :ratings, :submission_id
  end
end
