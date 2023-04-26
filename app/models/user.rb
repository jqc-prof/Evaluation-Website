class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # A User has many Rating records
  has_many :assignments
  has_many :submissions
  has_many :ratings
 

  def admin?
    role == 'admin'
  end
end
