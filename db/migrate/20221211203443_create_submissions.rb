class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.string :name
      t.string :description
      t.references :assignment, foreign_key: true

      t.timestamps
    end
  end
end
