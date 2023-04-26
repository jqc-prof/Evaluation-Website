class Submission < ApplicationRecord
  belongs_to :assignment
  has_many :ratings, dependent: :destroy
  # validates :assignment_id, presence: false
  # validates :name, presence: false
  belongs_to :user
  

end
